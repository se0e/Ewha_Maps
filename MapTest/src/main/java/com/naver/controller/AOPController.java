package com.naver.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MessageVO;
import kr.co.service.MessageService;

@Controller
@RequestMapping("/aop")
public class AOPController {

	 @Inject
	 private MessageService service;
	 
	 @RequestMapping("/create")
	 public void create() {
		 
	 }
	 
	 @RequestMapping(value="/create", method=RequestMethod.POST)
	 public String create(MessageVO vo) {
		 service.create(vo);
		 return "aop/list";
	 }
	 
	 @RequestMapping("/readMessage")
	 public String readMessage(int mid, String userId, Model model) {
		MessageVO vo= service.readMessage(mid, userId);
		model.addAttribute("vo",vo);
		 return "aop/readmessage";
	 }
	
}
