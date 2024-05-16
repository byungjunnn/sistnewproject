package com.boot.ex1;

import lombok.Data;

//@Setter
//@Getter
//@ToString
@Data //위의 3개를 합친 것과 같은 어노테이션
public class TestDto {

	private String name;
	private String addr;
}
