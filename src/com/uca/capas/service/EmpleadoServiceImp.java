package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Empleado;
import com.uca.capas.domain.Sucursal;
import com.uca.capas.repository.EmpleadoRepository;

@Service
public class EmpleadoServiceImp implements EmpleadoService{

	@Autowired
	EmpleadoRepository empRepo;
	
	@Override
	public List<Empleado> findAll() {
		// TODO Auto-generated method stub
		return empRepo.findAll();
	}

	@Override
	public List<Empleado> findOne(Integer id) {
		// TODO Auto-generated method stub
		//return empRepo.findById(id).get();
		Sucursal s = new Sucursal();
		s.setIdSucursal(id);
		return empRepo.findBySucursal(s);
	}

	@Override
	public Empleado save(Empleado e) {
		// TODO Auto-generated method stub
		return empRepo.save(e);
	}

	@Override
	public Empleado findEmp(Integer id) {
		// TODO Auto-generated method stub
		return empRepo.getOne(id);
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		empRepo.deleteById(id);
	}

}
