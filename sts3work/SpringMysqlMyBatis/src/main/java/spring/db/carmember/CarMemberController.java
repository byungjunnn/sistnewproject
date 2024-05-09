package spring.db.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
=======
>>>>>>> 9378f6f28662beab38a929c3907021905de757d4

import spring.db.may.SpringCarDto;

@Controller
@RequestMapping("/member")
public class CarMemberController {

	@Autowired
	CarMemberDaoInter memberInter;
	
	@GetMapping("/list")
	public String list(Model model) {
		//dao로부터 총갯수 저장
		int totalCount=memberInter.getTotalCount();
		
		//목록 가져오기
		List<CarMemberDto> list=memberInter.getAllMemberDatas();
		
		//request에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
	}
	
	@GetMapping("/writeform")
	public String memberform() {
		return "carmember/memberform";
	}
	
	@PostMapping("/write")
	public String insert(@ModelAttribute("dto") CarMemberDto dto) {
		
		memberInter.insertMember(dto);
		return "redirect:list";
	}
<<<<<<< HEAD
	
	@GetMapping("/updateform")
	public String uform(@RequestParam String num, Model model) {
		
		CarMemberDto dto=memberInter.getOneData(num);
		model.addAttribute("dto", dto);
		return "carmember/updateform";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("dto") CarMemberDto dto) {
		
		memberInter.updateCarMember(dto);
		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String num) {
		
		memberInter.deleteMember(num);
		return "redirect:list";
	}
=======
>>>>>>> 9378f6f28662beab38a929c3907021905de757d4
}
