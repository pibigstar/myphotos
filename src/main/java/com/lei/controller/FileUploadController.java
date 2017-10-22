package com.lei.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.lei.model.Picture;
import com.lei.model.User;
import com.lei.utils.QiNiuUtil;

@Controller
@RequestMapping(value="upload.do")
public class FileUploadController {
	
		@ResponseBody
	    @RequestMapping(params="uploadImg",method=RequestMethod.POST)
	    public Picture uploadImage(@RequestParam MultipartFile[] imagesFile,HttpSession session) throws IOException{
	        User user = (User)session.getAttribute("user");
			Picture pic = new Picture();
	        List<String> paths = new ArrayList<String>();
	        for(MultipartFile file : imagesFile){   
	            if(file.isEmpty()){ 
	            	System.out.println("文件未上传");
	            }else{   
	            	String savePath = user.getUsername()+"/"+UUID.randomUUID().toString()+".jpg";
					QiNiuUtil.upload(file.getInputStream(),savePath);
	                paths.add(savePath);
	            }   
	        } 
	        pic.setPaths(paths);
	        return pic;
	    }
}
