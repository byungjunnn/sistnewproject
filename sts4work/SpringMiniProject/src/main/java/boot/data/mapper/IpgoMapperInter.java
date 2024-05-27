package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ipgoDto;

@Mapper
public interface IpgoMapperInter {

	public int getTotalCount(); //메서드명이 sql의 id가 됨
	public void insertIpgo(ipgoDto dto);
	public List<ipgoDto> getAllDatas();
}
