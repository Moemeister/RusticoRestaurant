package com.uca.capas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.uca.capas.domain.Empleado;
import com.uca.capas.domain.Sucursal;
import com.uca.capas.domain.User;


@Repository
public interface EmpleadoRepository extends JpaRepository<Empleado, Integer> {

	public List<Empleado> findBySucursal(Sucursal id);
}
