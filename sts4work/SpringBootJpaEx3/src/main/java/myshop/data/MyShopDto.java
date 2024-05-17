package myshop.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data //setter, getter, toString 합쳐진 것
@Entity 
@Table(name = "myshop") //자동으로 myshop이라는 테이블이 mysql에 만들어짐, 변수가 변경될 경우 자동수정
public class MyShopDto {

	@Id //각 엔티티를 구별할 수 있는 식별자 역할(시퀀스)
	@GeneratedValue(strategy = GenerationType.AUTO) //자동으로 
	private long num;
	
	@Column(name = "sangname") //컬럼명이 같으면 생략 가능
	private String sangname;
	
	@Column //컬럼명이 같아서 생략
	private String sangprice;
	
	@Column
	private String sangcolor;
	
	@Column
	private String sangipgo;
	
	@CreationTimestamp //엔티티 생성 시점의 시간 자동등록
	@Column(updatable = false) //수정시 이 컬럼은 수정하지 않겠다는 뜻
	private Timestamp writeday;
}
