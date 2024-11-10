package com.neusoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_order")
public class Order{
    private int id;
    private String code;//订单号
    private User user;//与用户表关联
    private Rent rent;//与租车表 关联
    private Car car;//与汽车表关联
    private Date createTime;//订单时间
    private int isDelete;//0：不删除 1：删除
    private int state ;//订单状态 0:未审核 1：审核
    private int isDeal ;//交易状态 0:未交易 1：已经交易
    private Long totalPrice;//交易金额
    private Date finishTime;//交易时间
    
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    
    public String getCode() {
        return code;
    }

    
    public void setCode(String code) {
        this.code = code;
    }

    @ManyToOne
    @JoinColumn(name="user_id")

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
    @ManyToOne
    @JoinColumn(name="car_id")
    public Car getCar() {
		return car;
	}


	public void setCar(Car car) {
		this.car = car;
	}

    
    public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getIsDelete() {
        return isDelete;
    }

    
    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}

	@ManyToOne
    @JoinColumn(name="rent_id")
	public Rent getRent() {
		return rent;
	}

	public void setRent(Rent rent) {
		this.rent = rent;
	}

	public int getIsDeal() {
		return isDeal;
	}

	public void setIsDeal(int isDeal) {
		this.isDeal = isDeal;
	}

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	

	
  
    
}