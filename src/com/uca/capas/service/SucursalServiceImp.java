package com.uca.capas.service;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uca.capas.domain.Sucursal;
import com.uca.capas.repository.SucursalRepo;

@Service
public class SucursalServiceImp implements SucursalService{

	@Autowired
	SucursalRepo surepo;
	
	@Autowired
	private EntityManager entityManager;

	
	@Override
	public List<Sucursal> findAll() {
		// TODO Auto-generated method stub
		return surepo.findAll();
	}

	@Override
	public Sucursal save(Sucursal s){
		// TODO Auto-generated method stub
		return surepo.save(s);
	}

	@Override
	public Sucursal findOne(Integer id) {
		// TODO Auto-generated method stub
		return surepo.findById(id).get();
	}

}
