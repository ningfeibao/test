package com.hand.service;

import com.hand.pojo.User;

public interface UserService {

	public User selectUser(String account, String password);
}
