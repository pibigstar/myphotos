package com.lei.service;

import java.util.List;

import com.lei.model.Photo;

public interface PhotoServiceI {

	void save(Photo photo);

	List<Photo> getList(String theme);

	List<Photo> getAllList();

	Photo getPhoto(String id);

}
