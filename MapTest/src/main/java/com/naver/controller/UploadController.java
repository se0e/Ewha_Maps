package com.naver.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.utils.UploadFileUtils;

@Controller
public class UploadController {

	// 여기 name은 servlet-context.xml의 uploadPath임.
	@Resource(name="uploadPath")
	private String uploadPath;
	
							// 일반업로드
	@RequestMapping(value="/uploadForm", method=RequestMethod.GET)
	public void uploadForm() {
		
	}
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
	public void uploadForm(MultipartHttpServletRequest request, Model model) throws IOException {
	// MultipartFile : 파일만 보내면 상관 없으나 파일 말고 다른 데이터도 받으려면 사용하면 안됨.
	// MultipartHttpServletRequest 를 사용해서 아래처럼 선언해야 다른 데이터도 받아올 수 있다.
		
		MultipartFile file= request.getFile("file");
		String id= request.getParameter("id");
		
		System.out.println("---------------------------------");
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		System.out.println(file.getContentType());
		System.out.println(id);
		System.out.println("---------------------------------");
		
		UUID uid= UUID.randomUUID(); // static메서드
		String savedName= uid.toString()+"_"+file.getOriginalFilename(); // 저장할 파일의 이름 설정(중복을피하기위한)
								//  폴더주소,   파일명
		File target= new File(uploadPath, savedName);
							//  file의 byte를, 저장함
		FileCopyUtils.copy(file.getBytes(), target); // 실제 파일을 해당 폴더에 업로드하는 역할
	}
	
						   // iframe을 이용한 업로드
	@RequestMapping(value="/iuploadForm", method= RequestMethod.POST)
	public String iUploadForm(MultipartFile file, Model model) throws IOException {
	
		UUID uid= UUID.randomUUID();
		String savedName= uid.toString()+"_"+file.getOriginalFilename();
		File target= new File(uploadPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);
		
		// 파일명 바인딩하기 (관리하고 있는 파일명을 알기 위해서)
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	
							// Ajax를 이용한 업로드
	@RequestMapping(value="uploadAjax", method= RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	// ajax사용이기때문에 responsebody사용
	@ResponseBody																						// 이걸 넣지 않으면 한글파일명일때 한글이 깨져버림
	@RequestMapping(value="uploadAjax", method= RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartHttpServletRequest request) throws IOException {
		
		ResponseEntity<String> entity= null;
		MultipartFile file= request.getFile("file");
		
		try {
			String msg= UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			entity= new ResponseEntity<String>(msg, HttpStatus.OK);
		} catch(Exception e){
			e.printStackTrace();
			entity= new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		 return entity;
	}
	
}	
