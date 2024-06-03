package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.AnswerMboardDto;
import boot.data.service.AnsMboardService;
import boot.data.service.MemberService;

@RestController
public class AnswerMboardRestController {

	@Autowired
	AnsMboardService service;
	
	@Autowired
	MemberService mservice;
	
	
	//insert
	@PostMapping("/board/ainsert")
	public void insert(@ModelAttribute AnswerMboardDto dto,HttpSession session) {

		//로그인한 아이디
		String myid=(String)session.getAttribute("myid");
		
		//작성자 이름
		String name=mservice.getName(myid);
		
		//dto에 넣기
		dto.setMyid(myid);
		dto.setName(name);
		
		service.insertAnswer(dto);
	}
	
	//전체출력
	@GetMapping("/board/alist")
	public List<AnswerMboardDto> alist(String num){
		return service.getAllAnswer(num);
	}
	
	//수정폼
	@GetMapping("/board/adata")
	public AnswerMboardDto data(String idx) {
		return service.getAnswer(idx);
	}
	
	//수정
	@PostMapping("/board/aupdate")
	public void aupdate(AnswerMboardDto dto) {
		service.updateAnswer(dto);
	}
	
	//삭제
	@GetMapping("/board/adelete")
	public void delete(String idx) {
		service.deleteAnswer(idx);
	}
}
