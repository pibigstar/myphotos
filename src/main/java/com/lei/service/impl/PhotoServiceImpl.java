package com.lei.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lei.dao.PhotoMapper;
import com.lei.model.Photo;
import com.lei.service.PhotoServiceI;

@Service("photoService")
public class PhotoServiceImpl implements PhotoServiceI {

	@Resource
	private PhotoMapper photoMapper;
	
	@Override
	public void save(Photo photo) {
		photoMapper.insert(photo);
	}

}
