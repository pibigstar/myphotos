package com.lei.service.impl;

import java.util.List;

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

	@Override
	public List<Photo> getList(String theme) {
		return photoMapper.getPhotos(theme);
	}

	@Override
	public List<Photo> getAllList() {
		return photoMapper.getAllList();
	}

	@Override
	public Photo getPhoto(String id) {
		return photoMapper.selectByPrimaryKey(id);
	}
}
