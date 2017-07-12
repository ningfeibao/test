package com.hand.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hand.dao.UserDao;
import com.hand.pojo.User;
import com.hand.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public User selectUser(String account, String password) {

		return userDao.selectByInfo(account, password);
	}

}
