package com.naver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.MemberDTO;

@Controller
public class MyController {

	@RequestMapping("/doA")
	public void doA() {
		System.out.println("doA() 입니당");
	}
	
	@RequestMapping("/doB")
	public void doB(MemberDTO dto) {
		System.out.println(dto);
	}
	 
	@RequestMapping("/doC")
	public void doC(int id, String name, int age) {
		System.out.println("아이디: "+id+" 이름: "+name+" 나이: "+age);
	}
	
	@RequestMapping("/doD")
	public String doD() {
		System.out.println("doD()입니다");
		return "doD";
	}
	
	@RequestMapping("/doE")
	public String doE(Model model) {
		model.addAttribute("msg", "yes! I'm here!!");
		return "doE";
	}
	
	@RequestMapping("/doF")
	public String doF() {
		System.out.println("doF()를 거쳐서");
		return "redirect:/doG";
	}
	
	@RequestMapping("/doG")
	public String doG() {
		System.out.println("doG() 에왔습니다.");
		return "doG";
	}
	
	@RequestMapping("/doH")
	public String doH(Model model) {
		model.addAttribute("show", "show is not over");
		return "redirect:/doI";
	}
	
	@RequestMapping("/doI")
	public String doI(String show) {
		System.out.println(show);
		return "doI";
	}
	
	@RequestMapping("/doJ")
	public String doJ(Model model) {
		System.out.println("doJ() 에요");
		model.addAttribute("newK", "new content");
		return "redirect:/doK";
	}
	
	@RequestMapping("/doK")
	public String doK(String newK, Model model) {
		System.out.println("doK() 로왔어요. 받아온 값은 "+newK+" 에요");
		model.addAttribute("newK", newK);
		return "doK";
	}
	
	@RequestMapping("/doL")
	public String doL(Model model) {
		System.out.println("doL() 에서");
		model.addAttribute("simple", "simple is best");
		return "redirect:/doM";
	}
	
	@RequestMapping("/doM")
	public String doM(@ModelAttribute("simple") String simple) {
		System.out.println("doM() 으로 왔어요. 받아온 값은 "+simple+" 에요");
		return "doM";
	}
	
	@RequestMapping("/doO")
	public String doO(RedirectAttributes rtts) {
		System.out.println("doO()는 RedirectAttributes를 사용해요");
		rtts.addFlashAttribute("rttr", "RedirectAttriburtes Use Data");
		return "redirect:/doP";
	}
	
	@RequestMapping("/doP")
	public String doP(@ModelAttribute("rttr") String rttr) {
		System.out.println("doP()는 RedirectAttributes를 사용한 값을 받아왔어요");
		return "doP";
	}
	
	@RequestMapping("/doQ")
	public @ResponseBody MemberDTO doQ() { // JSON처리하기
		MemberDTO dto= new MemberDTO(1, "kk", 11);
		return dto;
	}
	
	@RequestMapping("/doR")
	public void doQ(@RequestParam int num) {
		System.out.println(num);
	}
	
	@RequestMapping("/doS")
	public ModelAndView doS() {
		ModelAndView mav= new ModelAndView(); // ModelAndView 객체 생성. (모델과 뷰 동시생성)
		mav.addObject("str", "this is ModelAndViwe"); // ModelAndView방식으로 바인딩
		mav.setViewName("sorry"); // 바인딩할 뷰(jsp)지정. 
		// 		--> sorry.jsp. 주소창엔 doS로 표시되지만 내용은 sorry.jsp출력
		return mav; //객체값리턴
	}


}
