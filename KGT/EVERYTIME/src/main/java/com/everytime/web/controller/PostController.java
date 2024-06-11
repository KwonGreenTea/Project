package com.everytime.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.everytime.web.domain.PostVO;
import com.everytime.web.service.PostService;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 클라이언트(JSP 페이지 등)와 service를 연결하는 역할
@RequestMapping(value="/post") // url : /ex02/board
@Log4j

public class PostController {
	
	@Autowired
	private PostService postService;

	@PostMapping("/new_post")
	public String newPOST(PostVO postVO, RedirectAttributes reAttr) {
		log.info("newPOST()");
		int result = postService.createPost(postVO);
		log.info(result);
		return "redirect:/main";
	}
	
	
}
