package com.neusoft.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_car")
public class Car{
    private int id;
    private String carType;//汽车型号
    private CarCategory carCategory;//汽车品牌
    private String carNumber;//车牌号
    private String carOilType;//汽油型号
    private String dailyPrice;//单日租金
    private String  distance;//行驶里程
    private String carImage;//图片
    private int isRecommend;//是否推荐：0:无推荐  1:是为推荐
    private int isDiscount;//是否优惠：0:无优惠 1：是为优惠
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
    @JoinColumn(name="car_category_id")
    public CarCategory getCarCategory() {
        return carCategory;
    }

    public void setCarCategory(CarCategory carCategory) {
        this.carCategory = carCategory;
    }


	public String getCarType() {
		return carType;
	}


	public void setCarType(String carType) {
		this.carType = carType;
	}


	public String getCarOilType() {
		return carOilType;
	}


	public void setCarOilType(String carOilType) {
		this.carOilType = carOilType;
	}


	public String getDailyPrice() {
		return dailyPrice;
	}


	public void setDailyPrice(String dailyPrice) {
		this.dailyPrice = dailyPrice;
	}


	public String getDistance() {
		return distance;
	}


	public void setDistance(String distance) {
		this.distance = distance;
	}


	public String getCarImage() {
		return carImage;
	}


	public void setCarImage(String carImage) {
		this.carImage = carImage;
	}

	
	public int getIsRecommend() {
		return isRecommend;
	}


	public void setIsRecommend(int isRecommend) {
		this.isRecommend = isRecommend;
	}


	public int getIsDiscount() {
		return isDiscount;
	}


	public void setIsDiscount(int isDiscount) {
		this.isDiscount = isDiscount;
	}


	public int getIsDelete() {
		return isDelete;
	}


	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}


	public String getCarNumber() {
		return carNumber;
	}


	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

   
  


    
  
    
  
   
}