package com.lei.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lei.model.Photo;
import com.lei.service.PhotoServiceI;

@Controller
public class ShowController {
	
	@Resource
	private PhotoServiceI PhotoService;
	
	/**
	 * 显示3D画廊
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/{id}/show.do", method =RequestMethod.GET )
	public String show(@PathVariable String id,ModelMap modelMap) {
		
		Photo photo = PhotoService.getPhoto(id);
		List<Photo> photos = PhotoService.getAllList();
		
		
		modelMap.put("photo", photo);
		modelMap.put("photos", photos);
		if (photo.getTheme().equals("1")) {
			String imgpath[] = photo.getImgsPath().split(",");
			for (int i = 0; i < imgpath.length; i++) {
				modelMap.put("img"+i, imgpath[i]);
			}
			return "hualang";
		}else if (photo.getTheme().equals("2")) {
			return "yuanbotu";
		}
		return "yuanbotu";
	}

}
