package com.lei.controller;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.lei.model.Photo;
import com.lei.service.PhotoServiceI;
import com.lei.utils.QiNiuUtil;

/**
 * 生成相册的控制器
 * Author: pibigstar
 * Created on: 2017年10月17日 下午7:34:55
 */
@Controller
public class CreatePhotoController {
	@Resource
	private PhotoServiceI photoService;

	@RequestMapping(value = "/createPhoto.do",method = RequestMethod.POST)
	public ModelAndView create(@RequestParam MultipartFile[] imagesFile,Photo photo,MultipartFile mp3File,String username) throws IOException {
		ModelAndView mv = new ModelAndView();
		StringBuffer imgPath = new StringBuffer();
		try {
			for (int i = 0; i < imagesFile.length; i++) {
				MultipartFile file = imagesFile[i];
				String savePath = "/"+username+"/"+photo.getName()+"/"+(i+1)+".jpg";
				QiNiuUtil.upload(file.getInputStream(),savePath);
				if (i>0) {
					imgPath.append(","+savePath);
				}
				System.out.println(imgPath);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(imgPath);
		photo.setId(UUID.randomUUID().toString());
		String mp3Path = "/"+username+"/"+photo.getName()+"/"+UUID.randomUUID().toString()+".mp3";
		QiNiuUtil.upload(mp3File.getInputStream(), mp3Path);
		photo.setMp3Path(mp3Path);


		photo.setImg(imgPath.toString());
		photoService.save(photo);

		mv.setViewName("index");
		return mv;

	}

	@RequestMapping(value = "/testFile.do",method=RequestMethod.POST)
	public void testFiles(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;  
		//获取文件到map容器中  
		Map<String,MultipartFile> fileMap = multipartRequest.getFileMap(); 
		System.out.println(fileMap.size());
	}

}
