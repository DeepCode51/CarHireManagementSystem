package com.neusoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_car_category")
public class CarCategory{
    private int id;//品牌编号
    private String cname;//品牌名称
    private int  isDelete; //0:不删除 1：删除
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    
    public void setId(int id) {
        this.id = id;
    }


    
    public String getCname() {
        return cname;
    }


    
    public void setCname(String cname) {
        this.cname = cname;
    }



	public int getIsDelete() {
		return isDelete;
	}


	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}


  

    
  

   
  
   
}