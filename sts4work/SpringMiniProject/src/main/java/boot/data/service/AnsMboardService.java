package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.AnswerMboardDto;
import boot.data.mapper.AnsMboardMapperInter;

@Service
public class AnsMboardService implements AnsMboardServiceInter {

	@Autowired
	AnsMboardMapperInter mapper;
	
	@Override
	public void insertAnswer(AnswerMboardDto dto) {
		mapper.insertAnswer(dto);
	}

	@Override
	public List<AnswerMboardDto> getAllAnswer(String num) {
		return mapper.getAllAnswer(num);
	}

	@Override
	public AnswerMboardDto getAnswer(String idx) {
		return mapper.getAnswer(idx);
	}

	@Override
	public void updateAnswer(AnswerMboardDto dto) {
		mapper.updateAnswer(dto);
	}

	@Override
	public void deleteAnswer(String idx) {
		mapper.deleteAnswer(idx);
	}

}
