package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberDTO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/maps")
public class MapController {

	@Inject
	private MemberService service;
	
	
	@RequestMapping("/map") // 전체목록출력
	public String select(Model model) {
		
		return "maps/map";
	}
	
}
