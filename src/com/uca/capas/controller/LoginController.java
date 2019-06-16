package com.uca.capas.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.dto.LoginDTO;
import com.uca.capas.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/")
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginDTO", new LoginDTO());
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	@ResponseBody
	public int main(@RequestParam(name = "user") String user, @RequestParam(name = "pass") String pass,
			HttpServletResponse response){
		
		if(userService.findUser(user, pass)==null) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return 1;
		} else {
			response.setStatus(HttpServletResponse.SC_OK);
			return 0;
		}
		
	}

}
