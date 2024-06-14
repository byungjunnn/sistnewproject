package com.code.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code.dto.HireDto;
import com.code.mapper.HireMapperInter;

@Service
public class HireService implements HireServiceInter {

	@Autowired
	HireMapperInter mapper;
	
	@Override
	public void hireInsert(HireDto dto) {
		mapper.hireInsert(dto);
	}
}
