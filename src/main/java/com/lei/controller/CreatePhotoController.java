package com.lei.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.lei.model.Photo;
import com.lei.model.User;
import com.lei.service.PhotoServiceI;
import com.lei.utils.QiNiuUtil;

/**
 * 生成相册的控制器
 * Author: pibigstar
 * Created on: 2017年10月17日 下午7:34:55
 */
@Controller
@RequestMapping(value = "photo.do")
public class CreatePhotoController {
	@Resource
	private PhotoServiceI photoService;

	@RequestMapping(params = "createPhoto",method = RequestMethod.POST)
	public String create(@RequestParam("imagesPath") String[] imgsPath,Photo photo,MultipartFile mp3File,HttpSession session) throws IOException {
		User user =(User)session.getAttribute("user");
		
		StringBuffer imgPath = new StringBuffer();
		for (int i = 0; i < imgsPath.length; i++) {
			if (i>0) {
				imgPath.append(",");
			}
			imgPath.append(imgsPath[i]);
		}
		
		photo.setId(UUID.randomUUID().toString());
		photo.setUserId(user.getId());
		String mp3Path = "";
		if (mp3File.getBytes().length>0) {
			mp3Path = user.getUsername()+"/"+UUID.randomUUID().toString()+".mp3";
			QiNiuUtil.upload(mp3File.getInputStream(), mp3Path);
		}else {
			mp3Path = "default/mp3/love.mp3";
		}
		photo.setMp3Path(mp3Path);
		photo.setCreateTime(new Date());
		photo.setImgsPath(imgPath.toString());
		photoService.save(photo);

		return "redirect:user.do?toIndex";
	}
}
