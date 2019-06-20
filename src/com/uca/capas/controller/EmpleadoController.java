package com.uca.capas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.service.EmpleadoService;
import com.uca.capas.service.SucursalService;

@Controller
public class EmpleadoController {

	
	@Autowired
	EmpleadoService empService;
	
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public ModelAndView perfil(@RequestParam(name = "proId") Integer id){
		ModelAndView mav = new ModelAndView();
		mav.addObject("empleado", empService.findOne(id));
		mav.setViewName("profile");
		return mav;
	}
	
}
