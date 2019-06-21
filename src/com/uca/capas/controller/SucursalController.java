package com.uca.capas.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.DelId;
import com.uca.capas.domain.Sucursal;
import com.uca.capas.service.SucursalService;

@Controller
public class SucursalController {

	@Autowired
	SucursalService sucService;
	
	
	@RequestMapping(value = "/sucursales", method = RequestMethod.GET)
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("sucursal", sucService.findAll());
		mav.setViewName("sucursales");
		return mav;
	}
	
	@RequestMapping(value="/new")
	public ModelAndView insert() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("sucursal",new Sucursal());
		mav.setViewName("registrar");
		return mav; 
	}
	
	
	@RequestMapping(value="/savesucursal", method = RequestMethod.POST)
	public ModelAndView saveSucursal(@Valid @ModelAttribute("sucursal") Sucursal s, BindingResult r){
		ModelAndView mav = new ModelAndView();
		
		if(r.hasErrors()){
			r.getAllErrors().forEach((element)->{
				System.out.println(element.getDefaultMessage());
			});
			mav.addObject("resultado", 0);
			mav.setViewName("registrar");
		}
		else{
			sucService.save(s);
			mav.addObject("resultado", 1);
			mav.setViewName("registrar");
		}
		return mav;
	}
	
	@RequestMapping("/edit")
	public ModelAndView editarSucursal(@RequestParam("editId") Integer idsucursal){
		ModelAndView mav = new ModelAndView();
		Sucursal sucursal = sucService.findOne(idsucursal);
		mav.addObject("sucursal", sucursal);
		mav.setViewName("registrar");
		return mav;
	}
	
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	
//	public int eliminar(@RequestBody @RequestParam(name = "delId") Integer id, HttpServletResponse response){
//		ModelAndView mav = new ModelAndView();
//		sucService.delete(id);
//		response.setStatus(HttpServletResponse.SC_OK);
//	
//		return 1;
//	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public int eliminar(@RequestBody DelId id , HttpServletResponse response){
	
		sucService.delete(id.getDelId());
		response.setStatus(HttpServletResponse.SC_OK);
		
		return 1;
	}
	
	
	
		
}
