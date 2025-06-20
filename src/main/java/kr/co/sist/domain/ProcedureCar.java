package kr.co.sist.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProcedureCar {
	private String model, car_year,car_option;
	private int price;
	private Timestamp hiredate;
}
