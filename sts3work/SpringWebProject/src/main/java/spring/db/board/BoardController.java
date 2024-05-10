package spring.db.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardDaoInter dao;
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {
		ModelAndView mview=new ModelAndView();
	
		//페이징에 필요한 변수
		int totalCount=dao.getTotalCount();
		int perPage=3; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한 블럭당 보여질 페이지 갯수
		int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0번, 오라클은 1번)
		int startPage; //각 블럭당 보여질 시작페이지
		int endPage; //각 블럭당 보여질 끝페이지
		int totalPage; // 총 페이지
		int no; //각 페이지당 출력할 시작번호
		
		//총 페이지수 구하기
		//총 글갯수/한페이지당보여질갯수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
			
		//각 블럭당 보여질 시작페이지
		//perBlock=5일 경우 현제페이지가 1~5일 경우, 시작페이지가 1, 끝페이지가 5
		//현재가 13이면, 시작:11 끝: 15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		
		//총 페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
		if(endPage>totalPage){
			endPage=totalPage;
		}
		//각 페이지에서 보여질 시작번호
		//1페이지:0, 2페이지:5 3페이지:10....
		start=(currentPage-1)*perPage;
		
		//각 페이지당 출력할 시작번호 구하기
		//총글갯수가 23, 1페이지:23 2페이지:18 3페이지:13
		no=totalCount-(currentPage-1)*perPage;
		
		//List<BoardDto> list=dao.getAllDatas();
		List<BoardDto> list=dao.getList(start, perPage);
		
		//request에 저장
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);
		
		
		//포워드
		mview.setViewName("board/boardlist");
		
		return mview;
	}
	
	//inset form
	@GetMapping("/addform")
	public String addform() {
		return "board/writeform";
	}
	
	//insert
	@PostMapping("/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session,
			@RequestParam String currentPage) {
		
		//이미지가 업로드될 폴더
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		
		//이미지 업로드 안 할 경우 "no" 또는 null 이라고 저장
		String photo="";
		
		//사진선택을 하면, 로 나열
		if(upload.get(0).getOriginalFilename().equals("")) {
			photo="no";
		}else {
			for(MultipartFile f:upload) {
				String fName=f.getOriginalFilename();
				photo+=fName+", ";
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//마지막 컴마 제거
			photo=photo.substring(0, photo.length()-2);
		}
		
		//dto의 photo에 넣어주기
		dto.setPhoto(photo);
		
		//insert
		dao.insertBoard(dto);
		
		//목록이 아닌 내용보기로 가려면
		int num=dao.getMaxNum();
		
		return "redirect:content?num="+num+"&currentPage="+1;
	}
	
	//content
	@GetMapping("/content")
	public String content(@RequestParam int num, Model model,
			@RequestParam String currentPage) {
		
		dao.updateReadcount(num);
		
		//dto가져와서 request에 저장
		BoardDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return "board/content";
	}
}
