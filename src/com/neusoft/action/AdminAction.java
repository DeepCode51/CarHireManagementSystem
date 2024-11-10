package com.neusoft.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */

@Controller("adminAction")
@Scope("prototype")
public class AdminAction extends ActionSupport implements ModelDriven<Admin>{
	
	private static final long serialVersionUID = 1L;

	//==========model==============
	  private Admin admin;
		@Override
		public Admin getModel() {
			if(admin==null) admin = new Admin();
			return admin;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private AdminService adminService;
	
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
    /**
     * 登陆以后进入首页
     * @return
     * @throws IOException 
     */
    public void index() throws IOException{
        HttpServletResponse resp = ServletActionContext.getResponse();
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = null;
        JSONObject json  = new JSONObject();
        //查询该用户是否存在
    	 Admin ad1 =  adminService.getByUserName(admin);
    	 //查询用户和密码是否 
    	 Admin ad =  adminService.login(admin);
    	if(ad1==null){
    		 json.put("result", 3); //该用户不存在
    	}else{
		   if(ad!=null){
	        	 json.put("result", 1); //登录成功
	        	 HttpSession session = ServletActionContext.getRequest().getSession();
	           session.setAttribute("adminName", ad.getAdminName());
	           session.setAttribute("adminId", ad.getId());
	           ActionContext.getContext().put("url", "/admin_admin.do");
	        }else{
	        	json.put("result",2);//密码错误
	        }
    	}
         out = resp.getWriter();
         out.write(json.toString());
		
    }
	
	/**
	 * 列表分页查询
	 */
	public String admin(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Admin where 1=1 and isDelete=0");
		if(admin.getAdminName()!=null&& !"".equals(admin.getAdminName() )){
			 sb.append(" and adminName like :adminName");
			 alias.put("adminName", "%"+admin.getAdminName()+"%" );
		}
		sb = sb.append(" order by id desc");
		//分页查询
		Pager<Admin> pagers = adminService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("admin", admin);
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
		adminService.save(admin);
		ActionContext.getContext().put("url", "/admin_admin.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		Admin n = adminService.getById(admin.getId());
		ActionContext.getContext().put("admin", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		Admin n = adminService.getById(admin.getId());
		ActionContext.getContext().put("admin", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		adminService.update(admin);
		ActionContext.getContext().put("url", "/admin_admin.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		Admin a = adminService.getById(admin.getId());
		a.setIsDelete(1);
		adminService.update(a);
		ActionContext.getContext().put("url", "/admin_admin.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
