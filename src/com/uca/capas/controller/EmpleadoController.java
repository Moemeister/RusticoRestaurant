	package com.uca.capas.controller;

import javax.servlet.http.HttpServletResponse;

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
import com.uca.capas.domain.Empleado;
import com.uca.capas.domain.Sucursal;
import com.uca.capas.service.EmpleadoService;
import com.uca.capas.service.SucursalService;

@Controller
public class EmpleadoController {

	@Autowired
	EmpleadoService empService;
	
	@Autowired
	SucursalService sucService;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView perfil(@RequestParam(name = "proId") Integer id){
		ModelAndView mav = new ModelAndView();
		Sucursal sucursal = sucService.findOne(id);
		mav.addObject("empleado", empService.findOne(id));
		mav.addObject("sucursal", sucursal);
		mav.setViewName("profile");
		return mav;
	}
	@RequestMapping("/editEmp")
	public ModelAndView editarCliente(@RequestParam("editId") Integer id,@RequestParam("IdSuc") Integer id2){
		ModelAndView mav = new ModelAndView();
		Empleado empleado = empService.findEmp(id);
		mav.addObject("empleado", empleado);
		mav.addObject("sucursal", sucService.findOne(id2));
		mav.setViewName("editEmp");
		return mav;
	}
	@RequestMapping("/addEmp")
	public ModelAndView insert(@RequestParam("IdSuc") Integer id) {
		ModelAndView mav = new ModelAndView();
		Sucursal sucursal = sucService.findOne(id);
		mav.addObject("empleado",new Empleado());
		mav.addObject("sucursal",sucursal);
		mav.setViewName("editEmp");
		return mav; 
	}
	
	@RequestMapping(value="/saveEmp", method = RequestMethod.POST)
	public ModelAndView saveCliente(@ModelAttribute("empleado") Empleado s,@RequestParam("proId") Integer id, BindingResult r){
		ModelAndView mav = new ModelAndView();
		Sucursal sucursal = sucService.findOne(id);
		s.setSucursal(sucursal);
		if(r.hasErrors()){
			r.getAllErrors().forEach((element)->{
				System.out.println(element.getDefaultMessage());
			});
			mav.addObject("resultado", 0);
			mav.addObject("sucursal", sucursal);
			mav.setViewName("editEmp");
		}
		else{
			empService.save(s);
			mav.addObject("resultado", 1);
			mav.addObject("sucursal", sucursal);
			mav.setViewName("editEmp");
		}
		return mav;
	}
	
	@RequestMapping(value = "/deleteEmp", method = RequestMethod.POST)
	@ResponseBody
	public int eliminar(@RequestBody DelId id , HttpServletResponse response){
	
		empService.delete(id.getDelIdEmp());
		response.setStatus(HttpServletResponse.SC_OK);
		
		return 1;
	}
	
}
