package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Comment;
import logic.ShopService;

@Controller
public class CommentController {

	@Autowired
	ShopService service;
	
	@RequestMapping("comm/register")
	public ModelAndView comment(Comment comm, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.commregster(comm);
		mav.setViewName("item/detail");
		mav.addObject("comm", comm);
		return mav;
	}
	}