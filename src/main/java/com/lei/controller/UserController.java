package com.lei.controller;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lei.model.User;
import com.lei.service.UserServiceI;
import com.lei.utils.QiNiuUtil;
import com.lei.utils.ResourceUtil;

@Controller
public class UserController {

	@Resource
	private UserServiceI userService;

	/**
	 * 登录
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login.do",method = RequestMethod.POST)
	public ModelAndView login(User user,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User tUser = userService.login(user);
		if (tUser!=null) {
			mv.setViewName("index");
			session.setAttribute("user", tUser);
			return mv;
		}else {
			mv.setViewName("login");
			mv.getModel().put("message", "登录失败！");
			return mv;
		}
	}
	/**
	 * 注册
	 * @param user
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/regist.do",method = RequestMethod.POST)
	public ModelAndView regist(User user,HttpSession session, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		String code = request.getParameter("code").toUpperCase();  
		String imgCode =(String)session.getAttribute("code");  

		if (imgCode.equals(code)) {
			user.setId(UUID.randomUUID().toString().replaceAll("-", ""));
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
	
	/**
	 * 用户信息更改
	 * @param headFile
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value="updateUser.do",method = RequestMethod.POST)
	public ModelAndView updateUser(MultipartFile headFile,HttpServletRequest request,User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user");
        try {
			String savePath = "images/"+UUID.randomUUID().toString()+".jpg";
			
			QiNiuUtil.upload(headFile.getInputStream(),savePath);
			
			user.setIcon(ResourceUtil.getConfigByName("qiniu.path")+savePath);
			
			userService.update(user);
			mv.getModel().put("message", "更新用户信息成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
          
        return mv;  
		
	}
}
