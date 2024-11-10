package com.neusoft.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.Scope;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.neusoft.utils.Pager;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONObject;
import com.neusoft.model.*;
import com.neusoft.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	private static final long serialVersionUID = 1L;

	//==========model==============
	  private User user;
		@Override
		public User getModel() {
			if(user==null) user = new User();
			return user;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private UserService userService;
	
	//依赖注入 end  dao/service/===
	
	//-------------------------华丽分割线---------------------------------------------
	
	//============自定义参数start=============
	
	//============自定义参数end=============
	
	//-------------------------华丽分割线---------------------------------------------
	
	//============文件上传start=======================================================
	private File file;
	//提交过来的file的名字
    private String fileFileName;
    //提交过来的file的MIME类型
    private String fileContentType;
    public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	 //============文件上传end=========================================================
			
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============公=======共=======方=======法==========区=========start============//
	
	//注册
    public void register() throws IOException{
    	 HttpServletResponse resp = ServletActionContext.getResponse();
         resp.setContentType("application/json;charset=UTF-8");
         PrintWriter out = null;
         JSONObject json  = new JSONObject();
    	String hql="from User bean where bean.loginName =:loginName and bean.isDelete=0  ";
    	 Map<String,Object> alias = new HashMap<String,Object>();
		    alias.put("loginName", user.getLoginName() );
	     List<User> userList=userService.getByHQL(hql, alias);
	    if(userList.size() != 0){
	    	 json.put("result", 2);//该用户存在
			}else{
				userService.save(user);
				 json.put("result", 1);//注册成功
			}
	    out = resp.getWriter();
        out.write(json.toString());
    }
    
    
			
    //登录 
    public void login() throws IOException{
        HttpServletResponse resp = ServletActionContext.getResponse();
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = null;
        JSONObject json  = new JSONObject();
        User u1 =userService.getByUserName(user);
        User u =userService.login(user);
    	if(u1==null){
    		 json.put("result", 3); //该用户不存在
    	}else{
		   if(u!=null){
	        	 json.put("result", 1); //登录成功
	        	 HttpSession session =ServletActionContext.getRequest().getSession();
	  			session.setAttribute("loginName", u.getLoginName());
	  			session.setAttribute("userId", u.getId());
	  			session.setAttribute("user", u);
	        }else{
	        	json.put("result",2);//密码错误
	        }
    	}
         out = resp.getWriter();
         out.write(json.toString());
		
    }    
	
    
	
    //忘记密码
    public void changePassWord() throws IOException{
        HttpServletResponse resp = ServletActionContext.getResponse();
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = null;
        JSONObject json  = new JSONObject();
        User u1 =userService.getByUserName(user);
    	if(u1==null){
    		 json.put("result", 2); //该用户不存在
    	}else{
    		 User u2 =userService.getByUserNameAndQuestion(user);
    		 if(u2==null){
    			 json.put("result", 3); //该找回密码问题不正确
    		}else{
    			User u3 =userService.getByUserNameAndQuestionAndAnswer(user);
    			if(u3==null){
    				json.put("result", 4); //该找回密码答案不正确
    			}else{
    				User u = userService.getById(u3.getId());
    				u.setPassWord(user.getPassWord());
    			   	userService.update(u);//执行修改密码
    			    json.put("result", 1); //密码修改成功
    			}
    		}
	            
    	}
         out = resp.getWriter();
         out.write(json.toString());
		
    } 
    
    /**
	 * 跳转到个人中心页面
	 * @return
	 */
	public String myInfo(){
		//判断该用户是否已经登录，如果没登录跳入到登录页面
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
	   if(existUser==null){
		   return "userLogin"; 
	   }
		return SUCCESS;
	}
	
	/**
	 * 跳转到修改密码页面
	 * @return
	 */
	public String updatePassWord(){
		
		return SUCCESS;
	}
	
	
	
	/**
	 * 执行修改密码
	 * @return
	 */
    public void exUpdatePassWord() throws IOException{
    	 HttpServletResponse resp = ServletActionContext.getResponse();
         resp.setContentType("application/json;charset=UTF-8");
         PrintWriter out = null;
         JSONObject json  = new JSONObject();
       //判断该用户是否已经登录，如果没登录跳入到登录页面
 		User existUser = (User) ServletActionContext.getRequest().getSession()
 				.getAttribute("user");
 		 if(existUser!=null){
 			User u = userService.getById(existUser.getId());
 			u.setPassWord(user.getPassWord());
		   	userService.update(u);//执行修改密码
		    json.put("result", 1);//密码修改成功
 		   }
	    out = resp.getWriter();
        out.write(json.toString());
    }
	
    /**
	 * 跳转到修改个人信息页面
	 * @return
	 */
	public String updateMyInfo(){
		
		return SUCCESS;
	}
	
	
	
	/**
	 * 执行修改个人信息
	 * @return
	 */
    public void exUpdateMyInfo() throws IOException{
    	 HttpServletResponse resp = ServletActionContext.getResponse();
         resp.setContentType("application/json;charset=UTF-8");
         PrintWriter out = null;
         JSONObject json  = new JSONObject();
       //判断该用户是否已经登录，如果没登录跳入到登录页面
 		User existUser = (User) ServletActionContext.getRequest().getSession()
 				.getAttribute("user");
 		 if(existUser!=null){
 			User u = userService.getById(existUser.getId());
 			u.setPhone(user.getPhone());
 			u.setEmail(user.getEmail());
 			u.setQuestion(user.getQuestion());
 			u.setAnswer(user.getAnswer());
		   	userService.update(u);//执行修改密码
		   	//修改个人信息后需要重新更新session中用户信息
		   	ActionContext ac = ActionContext.getContext();
			Map session1 = ac.getSession();
			session1.remove("loginName");
			session1.remove("userId");
			session1.remove("user");
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("loginName", u.getLoginName());
			session.setAttribute("userId", u.getId());
			session.setAttribute("user", u);
		    json.put("result", 1);//个人信息修改成功
 		   }
	    out = resp.getWriter();
        out.write(json.toString());
    }
	
	
	/**
	 * 列表分页查询
	 */
	public String user(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from User where 1=1 and isDelete=0");
		if(user.getLoginName()!=null&& !"".equals(user.getLoginName() )){
			 sb.append(" and loginName like :loginName");
			 alias.put("loginName", "%"+user.getLoginName()+"%" );
		}
		sb = sb.append(" order by id desc");
		Pager<User> pagers = userService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("user", user);
		return SUCCESS;
    }
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String add(){
		return SUCCESS;
	}
	
	/**
	 * 执行添加
	 * @return
	 */
	public String exAdd(){
		userService.save(user);
		ActionContext.getContext().put("url", "/user_user.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		User n = userService.getById(user.getId());
		ActionContext.getContext().put("user", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		User n = userService.getById(user.getId());
		ActionContext.getContext().put("user", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		userService.update(user);
		ActionContext.getContext().put("url", "/user_user.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		User n = userService.getById(user.getId());
		n.setIsDelete(1);
		userService.update(n);
		ActionContext.getContext().put("url", "/user_user.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
