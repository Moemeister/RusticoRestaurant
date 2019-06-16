package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.User;
import com.uca.capas.repository.UserRepo;

@Service
public class UserServiceImp implements UserService{
	
	@Autowired
	UserRepo userRepository;

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

	@Override
	public User findUser(String user, String pass) {
		// TODO Auto-generated method stub
		return userRepository.findUser(user, pass);
	}
	
	

}
