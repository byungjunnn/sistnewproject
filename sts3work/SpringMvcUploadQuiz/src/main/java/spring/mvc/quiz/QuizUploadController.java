package spring.mvc.quiz;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/quiz")
public class QuizUploadController {

	@GetMapping("/myshop")
	public String uform() {
		return "quiz/quizUploadForm";
	}
	
	@PostMapping("/shopwrite")
	public ModelAndView read(
			@RequestParam String title,
			@RequestParam ArrayList<MultipartFile> photo,
			HttpServletRequest request,
			@RequestParam String price,
			@RequestParam String ipgo
			) {
		ModelAndView mview=new ModelAndView();
		
		//���ε��� ������� ���ϱ�
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/image");
		
		//���� ��¥�� �ð��� �̿��� ���ϸ� ����
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		ArrayList<String> files=new ArrayList<String>();
		
		//���ϸ� ���
		for(MultipartFile f:photo) {
			String fileName=sdf.format(new Date())+"_"+f.getOriginalFilename();
			files.add(fileName);
			
			//���� ���ε�
			try {
				f.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mview.addObject("files", files);
		mview.addObject("title", title);
		mview.addObject("price", price);
		mview.addObject("ipgo", ipgo);
		
		mview.setViewName("quiz/quizUploadWrite");
		
		return mview;
	}
}
