package com.uca.capas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.uca.capas.domain.User;

@Repository
public interface UserRepo extends JpaRepository<User,String> {
	
		public List<User> findAll();
		
		@Query(nativeQuery = true, value = "select usuario,pass from public.usuario where usuario = ?1 and pass = ?2")
		public User findUser(String user, String pass);

}
