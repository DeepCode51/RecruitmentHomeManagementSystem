package com.recruit.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;




@Controller
@RequestMapping("/blog")
public class BlogController {
	
	
	@RequestMapping(value = "/goBlog")
	public ModelAndView  goAllBlog(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
    	view.setViewName("blog/blogs");
		return view;
	}

	@RequestMapping(value = "/goContactUs")
	public ModelAndView  goContectUs(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
    	view.setViewName("blog/contactUs");
		return view;
	}
	
}
