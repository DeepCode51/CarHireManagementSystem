package com.neusoft.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.io.File;
import java.util.Calendar;
import java.util.Date;
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
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */

@Controller("rentAction")
@Scope("prototype")
public class RentAction extends ActionSupport implements ModelDriven<Rent>{
	
	private static final long serialVersionUID = 1L;

	//==========model==============
	  private Rent rent;
	  
	  private Integer carId;
	  
	  
	  
		public Integer getCarId() {
		return carId;
	}
	public void setCarId(Integer carId) {
		this.carId = carId;
	}
		@Override
		public Rent getModel() {
			if(rent==null) rent = new Rent();
			return rent;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private RentService rentService;
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private OrderService orderService;
	
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
	 * 前台执行确认租车添加
	 * @return
	 */
	public String exRentCar(){
		//根据页面传入的carId查出是哪一辆车
		Car c = carService.getById(carId);
		//判断该用户是否已经登录，如果没登录跳入到登录页面
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		if(existUser!=null){
			rent.setUser(existUser);
		}
		rent.setCar(c);
		rent.setIsDelete(0);
		//插入租车表中
		rentService.save(rent);
		Order order=new Order();
		 Calendar calendar = Calendar.getInstance();
		 order.setCode(""+calendar.getTime().getTime());
		 order.setCar(c);
		 order.setCreateTime(new Date());
		 order.setIsDelete(0);
		 order.setIsDeal(0);
		 order.setState(0);
		 order.setUser(existUser);
		 //根据日期计算价钱
		 Long price=(Math.abs(rent.getReturnTime().getTime()-rent.getRentTime().getTime())/ (1000 * 60 * 60 * 24))*Integer.parseInt(rent.getCar().getDailyPrice());
		 if(price!=0){
			 order.setTotalPrice(price);
		 }else{
			 order.setTotalPrice( Long.parseLong(rent.getCar().getDailyPrice()));
		 }
		 order.setRent(rent);
		 //插入订单表中
		 orderService.save(order);
		ActionContext.getContext().put("url", "/order_findOrderByUserId.do");
		return "redirect";
	}
	
	/**
	 * 列表分页查询
	 */
	public String rent(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Rent where 1=1 ");
		sb = sb.append("order by id desc");
		Pager<Rent> pagers = rentService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("rent", rent);
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
		rentService.save(rent);
		ActionContext.getContext().put("url", "/rent_rent.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		Rent n = rentService.getById(rent.getId());
		ActionContext.getContext().put("rent", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		Rent n =rentService.getById(rent.getId());
		ActionContext.getContext().put("rent", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		Rent n = rentService.getById(rent.getId());
		rentService.update(n);
		ActionContext.getContext().put("url", "/rent_rent.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		rentService.delete(rent.getId());
		ActionContext.getContext().put("url", "/rent_rent.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
