package myshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ModelAndViewMethodReturnValueHandler;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import myshop.dto.MyShopDto;
import myshop.service.MyShopService;

@Controller
@RequiredArgsConstructor
public class MyShopController {
   
   private final MyShopService service;

   
   @GetMapping("/")
   public String list(Model model) {
      
      int totalCount = service.getTotalCount();
      
      List<MyShopDto> list=service.getAllSangpums();
      
      model.addAttribute("totalCount", totalCount);
      model.addAttribute("list", list);
      
      return "myshop/shoplist";
   }
   
   @GetMapping("/addform")
   public String addform() {
      return "myshop/shopform";
   }
   
   @PostMapping("/insert")
   public String insert(@ModelAttribute("dto") MyShopDto dto,
		   @RequestParam MultipartFile upload, HttpSession session) {
	   
      String realpath = session.getServletContext().getRealPath("/photo");
      System.out.println(realpath);
      
      String uploadName = upload.getOriginalFilename();
      dto.setPhoto(uploadName);
      
      //실제 업로드
      try {
         upload.transferTo(new File(realpath+"\\"+uploadName));
      } catch (IllegalStateException | IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      service.insertMyShop(dto);
      return "redirect:/";
   }
   
   @GetMapping("/detail")
   public ModelAndView detail(@RequestParam int num) {
	   
	   ModelAndView mview=new ModelAndView();
	   
	   MyShopDto dto=service.getData(num);
	   
	   mview.addObject("dto", dto);
	   mview.setViewName("myshop/shopdetail");
	   
	   return mview;
   }
   
   @GetMapping("/delete")
   public String delete(@RequestParam int num,
		   HttpSession session) {
	   
	   String photo=service.getData(num).getPhoto();
	   
	   //기존 사진 먼저 삭제
		if(photo!="no") {
			String path=session.getServletContext().getRealPath("/photo");
			
			File file=new File(path+"\\"+photo);
			
			if(file.exists())
				file.delete();
		}
	   //해당 데이터 삭제
	   service.deleteMyShop(num);
	   
	   return "redirect:/";
   }

}