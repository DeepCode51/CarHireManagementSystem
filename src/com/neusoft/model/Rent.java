package com.neusoft.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_rent")
public class Rent {
	private int id;
	private User user;//与用户表关联
	private Car car;//汽车关联
	private Date rentTime; //租车时间
    private Date returnTime; //还车时间
    private int  isDelete; //0:不删除 1：删除
    
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }


    @ManyToOne
    @JoinColumn(name="car_id")
    public Car getCar() {
        return car;
    }

    
    public void setCar(Car car) {
        this.car = car;
    }

    @ManyToOne
    @JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

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

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}



    
  

}
