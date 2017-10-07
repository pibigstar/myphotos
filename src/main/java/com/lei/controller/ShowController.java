package com.lei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShowController {
	
	/**
	 * 显示3D画廊
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/{user}/show.do", method =RequestMethod.GET )
	public ModelAndView show(@PathVariable String user) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.getModel().put("name", user);
		
		mv.setViewName("index");
		
		return mv;
	}
	
	/**
	 * 显示轮圈图
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/{user}/show2.do", method =RequestMethod.GET )
	public ModelAndView show2(@PathVariable String user) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.getModel().put("name", user);
		
		mv.setViewName("index2");
		
		return mv;
	}
}
