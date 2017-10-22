package com.lei.dao;

import java.util.List;

import com.lei.model.Photo;

public interface PhotoMapper {
    int deleteByPrimaryKey(String id);

    int insert(Photo record);

    int insertSelective(Photo record);

    Photo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Photo record);

    int updateByPrimaryKey(Photo record);

	List<Photo> getPhotos(String theme);

	List<Photo> getAllList();
}