package com.neusoft.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.context.annotation.Scope;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.neusoft.utils.Pager;
import com.opensymphony.xwork2.ModelDriven;
import com.neusoft.dto.RateDto;
import com.neusoft.model.*;
import com.neusoft.service.OrderService;
import com.neusoft.service.RentService;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */

@Controller("orderAction")
@Scope("prototype")
public class OrderAction extends ActionSupport implements ModelDriven<Order>{
	
	private static final long serialVersionUID = 1L;

	//==========model==============
	  private Order order;
		@Override
		public Order getModel() {
			if(order==null) order = new Order();
			return order;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private RentService rentService;
	
	//依赖注入 end  dao/service/===
	
	//-------------------------华丽分割线---------------------------------------------
	
	//============自定义参数start=============
	private String startTime; //页面传入的开始时间
	private String endTime; //页面传入的结束时间
	private Integer flag;//标识位
	private Date rentTime;
	private Date returnTime;
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	//============自定义参数end=============
	
	//-------------------------华丽分割线---------------------------------------------

	public Date getRentTime() {
		return rentTime;
	}
	public void setRentTime(Date rentTime) {
		this.rentTime = rentTime;
	}
	public Date getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}
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
	 * 前台用户查看我的订单（我的订单）
	 * @return
	 */
	public String findOrderByUserId() {
		// 获得用户的id.
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		if(existUser==null){
			return "userLogin";
		}else{
			Map<String,Object> alias = new HashMap<String,Object>();
			StringBuffer sb = new StringBuffer();
			sb = sb.append("from Order where 1=1 ");
		
			sb = sb.append(" and user.id = :userId ");
			// 获得用户的id
			Integer userId = existUser.getId();
			alias.put("userId",userId);
			//根据编号模糊查询
			if(order.getCode()!=null){
				sb = sb.append(" and code like :code ");
				alias.put("code", "%"+order.getCode()+"%");
			}
			sb = sb.append("order by id desc");
			// 根据用户的id查询订单:
			Pager<Order> pagers =orderService.findByAlias(sb.toString(),alias);
			// 将PageBean数据带到页面上.
			ActionContext.getContext().put("pagers", pagers);
				return "findOrderByUid";
		}
	}
	
	/**
	 * 前台订单详情
	 * @return
	 */
	public String getByOrderId(){
		Order currOrder = orderService.getById(order.getId());
		ActionContext.getContext().put("order", currOrder);
		if(flag==1){//当前台传入为1时表示查看详情 当为2的时就为跳入到订单修改页面
			return SUCCESS;
		}else{
			return "updateOrderByOrderId";
		}
	}
	
	/**
	 * 前台修改订单
	 * @return
	 */
	public String exUpdateOrderByOrderId(){
		Order n = orderService.getById(order.getId());
		Rent r=rentService.getById(n.getRent().getId());
		r.setRentTime(rentTime);
		r.setReturnTime(returnTime);
		rentService.update(r);
		ActionContext.getContext().put("url", "/order_findOrderByUserId.do");
		return "redirect";
	}
	
	/**
	 * 前台用户查看租车记录（租车记录）
	 * @return
	 */
	public String rentInfoList() {
		// 获得用户的id.
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		if(existUser==null){
			return "userLogin";
		}else{
			Map<String,Object> alias = new HashMap<String,Object>();
			StringBuffer sb = new StringBuffer();
			sb = sb.append("from Order where 1=1 and isDeal=1");
		
			sb = sb.append(" and user.id = :userId ");
			// 获得用户的id
			Integer userId = existUser.getId();
			alias.put("userId",userId);
			//根据编号模糊查询
			if(order.getCode()!=null){
				sb = sb.append(" and code like :code ");
				alias.put("code", "%"+order.getCode()+"%");
			}
			sb = sb.append("order by id desc");
			// 根据用户的id查询订单:
			Pager<Order> pagers =orderService.findByAlias(sb.toString(),alias);
			// 将PageBean数据带到页面上.
			ActionContext.getContext().put("pagers", pagers);
		return SUCCESS;
		}
	}
	
	/**
	 * 前台租车记录中的已经完成租车详情
	 * @return
	 */
	public String getDetailByOrderId(){
		Map<String,Object> alias = new HashMap<String,Object>();
		String hql ="from Order where 1=1  and id = :id  and isDeal=1";
		 alias.put("id", order.getId());
		List<Order> orderList = orderService.getByHQL(hql, alias);
         if(orderList.size()>0){
        	ActionContext.getContext().put("order", orderList.get(0));
		 }
		return SUCCESS;
	}
	
	/**
	 * 列表分页查询
	 * @throws Exception 
	 */
	public String order() throws Exception{
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Order where 1=1 ");
		if(startTime != null && !"".equals(startTime)){
			sb.append(" and createTime >= :startTime");
		}
		if(endTime != null && !"".equals(endTime)){
			sb.append(" and createTime < :endTime");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(startTime != null && !"".equals(startTime)){
			alias.put("startTime", sdf.parse(startTime+" 00:00:00"));
		}
		if(endTime != null && !"".equals(endTime)){
			alias.put("endTime", sdf.parse(endTime+" 23:59:59"));
		}
		sb = sb.append(" order by id desc");
		Pager<Order> pagers =orderService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("order", order);
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
		orderService.save(order);
		ActionContext.getContext().put("url", "/order_order.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		Order n = orderService.getById(order.getId());
		ActionContext.getContext().put("order", n);
		if(flag==1){//当传入1时显示的详情
			return SUCCESS;
		}else if(flag==2){//当传入2时已经审核通过的详情
			return "agreeOrder";
		}else{//当传入2时已经完成交易的的详情
			return "finishOrder";
		}
	}
	
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		Order n = orderService.getById(order.getId());
		ActionContext.getContext().put("order", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		Order n = orderService.getById(order.getId());
		orderService.update(n);
		ActionContext.getContext().put("url", "/order_order.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		Order n = orderService.getById(order.getId());
		orderService.update(n);
		ActionContext.getContext().put("url", "/order_order.do");
		return "redirect";
	}
	
	/**
	 * 查询未审核订单列表分页查询
	 * @throws Exception 
	 */
	public String unAgreeOrder() throws Exception{
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Order where 1=1 and state=0 ");
		if(startTime != null && !"".equals(startTime)){
			sb.append(" and createTime >= :startTime");
		}
		if(endTime != null && !"".equals(endTime)){
			sb.append(" and createTime < :endTime");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(startTime != null && !"".equals(startTime)){
			alias.put("startTime", sdf.parse(startTime+" 00:00:00"));
		}
		if(endTime != null && !"".equals(endTime)){
			alias.put("endTime", sdf.parse(endTime+" 23:59:59"));
		}
		sb = sb.append(" order by id desc");
		Pager<Order> pagers =orderService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("order", order);
		return SUCCESS;
    }
	
	/**
	 * 查询未完成交易订单列表分页查询
	 * @throws Exception 
	 */
	public String unFinishOrder() throws Exception{
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Order where 1=1 and isDeal=0 ");
		if(startTime != null && !"".equals(startTime)){
			sb.append(" and createTime >= :startTime");
		}
		if(endTime != null && !"".equals(endTime)){
			sb.append(" and createTime < :endTime");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(startTime != null && !"".equals(startTime)){
			alias.put("startTime", sdf.parse(startTime+" 00:00:00"));
		}
		if(endTime != null && !"".equals(endTime)){
			alias.put("endTime", sdf.parse(endTime+" 23:59:59"));
		}
		sb = sb.append(" order by id desc");
		Pager<Order> pagers =orderService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("order", order);
		return SUCCESS;
    }
	
	/**
	 * 完成交易
	 * @return
	 */
	public String finishOrder(){
		Order n = orderService.getById(order.getId());
		n.setIsDeal(1);
		n.setFinishTime(new Date());
		orderService.update(n);
		ActionContext.getContext().put("url", "/order_order.do");
		return "redirect";
	}
	
	/**
	 * 审批通过
	 * @return
	 */
	public String agreeOrder(){
		Order n = orderService.getById(order.getId());
		n.setState(1);
		orderService.update(n);
		ActionContext.getContext().put("url", "/order_order.do");
		return "redirect";
	}
	
	/**
	 * 查询完成交易订单列表分页查询
	 * @throws Exception 
	 */
	public String hasFinishedOrder() throws Exception{
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Order where 1=1 and isDeal=1 ");
		if(startTime != null && !"".equals(startTime)){
			sb.append(" and finishTime >= :startTime");
		}
		if(endTime != null && !"".equals(endTime)){
			sb.append(" and finishTime < :endTime");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(startTime != null && !"".equals(startTime)){
			alias.put("startTime", sdf.parse(startTime+" 00:00:00"));
		}
		if(endTime != null && !"".equals(endTime)){
			alias.put("endTime", sdf.parse(endTime+" 23:59:59"));
		}
		sb = sb.append(" order by id desc");
		Pager<Order> pagers =orderService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("order", order);
		return SUCCESS;
    }
	
	
	 /**
     * 利润统计
     * @Description (TODO这里用一句话描述这个方法的作用)
     * @return
     */
    public String tongji(){
        List<RateDto> list =orderService.listAll();
        ActionContext.getContext().put("list", list);
        return SUCCESS;
    }

	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
