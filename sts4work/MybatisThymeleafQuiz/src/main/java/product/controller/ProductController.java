package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import product.dto.ProductDto;
import product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
	@GetMapping("/")
	public String list(Model model) {
		
		int totalCount=service.getTotalCount();
		List<ProductDto> list=service.getAllDatas();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "product/productlist";
	}
	
	@GetMapping("/addform")
	public String addform() {
		return "product/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute("dto") ProductDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) {

		String realpath = session.getServletContext().getRealPath("/productimage");
		System.out.println(realpath);

		String uploadName = upload.getOriginalFilename();
		dto.setPro_image(uploadName);

		// 실제 업로드
		try {
			upload.transferTo(new File(realpath + "\\" + uploadName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		service.insertProduct(dto);
		return "redirect:/";
	}

	@GetMapping("/detail")
	public ModelAndView detail(@RequestParam int pro_num) {

		ModelAndView mview = new ModelAndView();

		ProductDto dto = service.getData(pro_num);

		mview.addObject("dto", dto);
		mview.setViewName("product/productdetail");

		return mview;
	}
}
