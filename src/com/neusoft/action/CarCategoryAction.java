package com.neusoft.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import org.springframework.context.annotation.Scope;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.neusoft.utils.Pager;
import com.opensymphony.xwork2.ModelDriven;
import com.neusoft.model.*;
import com.neusoft.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */

@Controller("carCategoryAction")
@Scope("prototype")
public class CarCategoryAction extends ActionSupport implements ModelDriven<CarCategory>{
	
	private static final long serialVersionUID = 1L;

	//==========model==============
	  private CarCategory carCategory;
		@Override
		public CarCategory getModel() {
			if(carCategory==null) carCategory = new CarCategory();
			return carCategory;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private CarCategoryService carCategoryService;
	
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
	 * 列表分页查询
	 */
	public String carCategory(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from CarCategory where 1=1 and isDelete=0");
		if(carCategory.getCname()!=null&& !"".equals(carCategory.getCname() )){
			 sb.append(" and cname like :cname");
			 alias.put("cname", "%"+carCategory.getCname()+"%");
		}
		sb = sb.append(" order by id desc");
		Pager<CarCategory> pagers = carCategoryService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("carCategory", carCategory);
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
		carCategoryService.save(carCategory);
		ActionContext.getContext().put("url", "/carCategory_carCategory.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		CarCategory n = carCategoryService.getById(carCategory.getId());
		ActionContext.getContext().put("carCategory", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		CarCategory n = carCategoryService.getById(carCategory.getId());
		ActionContext.getContext().put("carCategory", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		carCategoryService.update(carCategory);
		ActionContext.getContext().put("url", "/carCategory_carCategory.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		CarCategory n = carCategoryService.getById(carCategory.getId());
		n.setIsDelete(1);
		carCategoryService.update(n);
		ActionContext.getContext().put("url", "/carCategory_carCategory.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
