package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.dto.ipgoDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@GetMapping("/member/list")
	public ModelAndView list() {

		ModelAndView mview = new ModelAndView();

		List<MemberDto> list = service.getAllMembers();

		mview.addObject("list", list);
		mview.addObject("mcount", list.size());

		mview.setViewName("/member/memberlist");

		return mview;
	}

	@GetMapping("/member/form")
	public String form() {
		return "/member/memberform";
	}

	// id 중복체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idcheckprocess(@RequestParam String id) {

		Map<String, Integer> map = new HashMap<>();

		// id 체크 메서드 호출
		int n = service.getSearchId(id);

		map.put("count", n); // 1 또는 0

		return map;
	}

	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto, MultipartFile myphoto, HttpSession session) {

		String path = session.getServletContext().getRealPath("/memberphoto");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String fName = sdf.format(new Date()) + "_" + myphoto.getOriginalFilename();
		dto.setPhoto(fName);

		try {
			myphoto.transferTo(new File(path + "\\" + fName));

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		service.insertMember(dto);

		return "redirect:list";
	}

	@GetMapping("/member/myinfo")
	public String info(Model model) {

		List<MemberDto> list = service.getAllMembers();

		model.addAttribute("list", list);

		return "/member/memberinfo";
	}

	// 회원목록 삭제
	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMember(String num) {
		service.deleteMember(num);
	}

	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoUpload(String num, MultipartFile photo, HttpSession session) {
		String path = session.getServletContext().getRealPath("/memberphoto");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(new Date()) + photo.getOriginalFilename();

		try {
			photo.transferTo(new File(path + "\\" + fileName));

			service.updatePhoto(num, fileName); // db업데이트

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//수정폼에 출력할 데이터 변환
	@GetMapping("/member/updateform")
	@ResponseBody
	public MemberDto getData(String num) {
		
		return service.getDataByNum(num);
	}
	
	//수정
	@PostMapping("/member/update")
	@ResponseBody
	public void update(MemberDto dto) {
		
		service.updateMember(dto);
	}
	
	//탈퇴
	@GetMapping("/member/deleteme")
	@ResponseBody
	public void deleteme(String num, HttpSession session) {
		
		service.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
	}

}
