package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Sucursal;
import com.uca.capas.repository.SucursalRepo;

@Service
public class SucursalServiceImp implements SucursalService{

	@Autowired
	SucursalRepo surepo;
	
	@Override
	public List<Sucursal> findAll() {
		// TODO Auto-generated method stub
		return surepo.findAll();
	}

}
