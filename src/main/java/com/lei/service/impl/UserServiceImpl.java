package com.lei.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lei.dao.UserMapper;
import com.lei.model.User;
import com.lei.service.UserServiceI;
import com.lei.utils.EncryptUtil;

@Service("userService")
public class UserServiceImpl implements UserServiceI {
	
	@Resource
	private UserMapper userMapper;
	

	@Override
	public User login(User user) {
		
		user.setPassword(EncryptUtil.e(user.getPassword()));
		User tUser = userMapper.getUser(user);
		
		return tUser;
	}

	@Override
	public void regist(User user) {
		user.setPassword(EncryptUtil.e(user.getPassword()));
		userMapper.insert(user);
	}

	@Override
	public void update(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}
}
