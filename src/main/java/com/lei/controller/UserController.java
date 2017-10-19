package com.lei.controller;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lei.model.User;
import com.lei.service.UserServiceI;
import com.lei.utils.QiNiuUtil;
import com.lei.utils.ResourceUtil;
@RequestMapping(value = "user.do")
@Controller
public class UserController {

	@Resource
	private UserServiceI userService;

	@RequestMapping(params="toIndex")
	public String toIndex(ModelMap modelMap) {
		return "redirect:index.jsp";
	}
	
	@RequestMapping(params="toLogin")
	public String toLogin(ModelMap modelMap) {
		return "redirect:login.jsp";
	}
	@RequestMapping(params="toRegist")
	public String toRegist(ModelMap modelMap) {
		return "redirect:regist.jsp";
	}
	@RequestMapping(params="toUser")
	public String toUser(ModelMap modelMap) {
		return "redirect:user.jsp";
	}
	
	
	/**
	 * 登录
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(params = "login",method = RequestMethod.POST)
	public String login(String code,User user,HttpSession session,ModelMap modelMap) {
		String imgCode =(String)session.getAttribute("code");  
		if (imgCode.equals(code.toUpperCase())) {
			User tUser = userService.login(user);
			if (tUser!=null) {
				session.setAttribute("user", tUser);
				return "redirect:user.do?toIndex";
			}else {
				modelMap.put("message", "登录失败！");
				return "login";
			}
		}else {
			modelMap.put("message", "验证码错误");
			return "login";
		}
		
	}
	/**
	 * 注册
	 * @param user
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "regist",method = RequestMethod.POST)
	public String regist(User user,HttpSession session, HttpServletRequest request,ModelMap modelMap) {
		
		String code = request.getParameter("code").toUpperCase();  
		String imgCode =(String)session.getAttribute("code");  
		if (imgCode.equals(code)) {
			user.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			userService.regist(user);
			modelMap.put("user", user);
			return "login";
		}else{  
			modelMap.put("message", "验证码错误");
			return "redirect:user.do?toRegist";
		}  
	}
	
	/**
	 * 用户信息更改
	 * @param headFile
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(params="updateUser",method = RequestMethod.POST)
	public String updateUser(MultipartFile headFile,ModelMap modelMap,HttpServletRequest request,User user) {
        try {
			String savePath = "images/"+UUID.randomUUID().toString()+".jpg";
			
			QiNiuUtil.upload(headFile.getInputStream(),savePath);
			
			user.setIcon(ResourceUtil.getConfigByName("qiniu.path")+savePath);
			
			userService.update(user);
			modelMap.put("message", "更新用户信息成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "redirect:user.do?toUser";  
	}
}
