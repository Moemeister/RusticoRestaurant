package com.uca.capas.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@SuppressWarnings("deprecation")
@Entity
@Table(schema="public", name="empleado")
public class Empleado {
	
	@Id
	@GeneratedValue(generator = "empleado_idempleado_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "empleado_idempleado_seq", sequenceName = "public.empleado_idempleado_seq", allocationSize = 1)
	@Column(name = "idempleado")
	private Integer idEmpleado;
		
	@NotEmpty(message = "ingrese el nombre del empleado")
	@Column(name = "nombre")
	private String nombre;
	
	@NotNull(message = "ingrese la edad del empleado")
	@Column(name = "edad")
	private Integer edad;
	
	@NotNull(message = "Defina el genero")
	@Column(name = "genero")
	private Boolean genero;
	 
	@NotNull(message = "Defina el estado")
	@Column(name = "estado")
	private Boolean estado;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idsuc")
	private Sucursal sucursal;
	
	
	public Integer getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(Integer idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getEdad() {
		return edad;
	}
	public void setEdad(Integer edad) {
		this.edad = edad;
	}
	public Boolean getGenero() {
		return genero;
	}
	public void setGenero(Boolean genero) {
		this.genero = genero;
	}
	public Boolean getEstado() {
		return estado;
	}
	public void setEstado(Boolean estado) {
		this.estado = estado;
	}
	public Sucursal getSucursal() {
		return sucursal;
	}
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
	
	public String getEstadoDelegate() {
		if(this.estado == null) return "";
		else {
			return estado == true ? "Activo":"Inactivo";
		}
	}
	public String getGenreDelegate() {
		if(this.estado == null) return "";
		else {
			return estado == true ? "Femenino":"Masculino";
		}
	}
	
	
}
