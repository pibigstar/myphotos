package com.lei.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lei.model.User;
import com.lei.service.UserServiceI;

@Controller
public class UserController {

	@Resource
	private UserServiceI userService;

	@RequestMapping(value = "/login.do",method = RequestMethod.POST)
	public ModelAndView login(User user) {
		ModelAndView mv = new ModelAndView();
		User tUser = userService.login(user);
		if (tUser!=null) {
			mv.setViewName("index");
			mv.getModel().put("user", tUser);
			return mv;
		}else {
			mv.setViewName("login");
			mv.getModel().put("message", "登录失败！");
			return mv;
		}
	}

	@RequestMapping(value = "/regist.do",method = RequestMethod.POST)
	public ModelAndView regist(User user,HttpSession session, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		String code = request.getParameter("code").toUpperCase();  
		String imgCode =(String)session.getAttribute("code");  

		if (imgCode.equals(code)) {
			userService.regist(user);
			mv.setViewName("login");
			mv.getModel().put("user", user);
			return mv;
		}else{  
			mv.setViewName("regist");
			mv.getModel().put("message", "验证码错误！");
			return mv;
		}  
	}
}
