package com.code.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.code.dto.HireDto;

@Mapper
public interface HireMapperInter {
	public void hireInsert(HireDto dto);
}
