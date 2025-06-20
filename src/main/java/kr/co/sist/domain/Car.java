package kr.co.sist.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Car {
	private String maker, model, car_year, car_img;
	private int price, cc;
	private Date hiredate;

}//class
