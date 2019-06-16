package com.uca.capas.service;

import java.util.List;

import com.uca.capas.domain.User;

public interface UserService {

	public List<User> findAll();
	
	public User findUser(String user, String pass);
}
