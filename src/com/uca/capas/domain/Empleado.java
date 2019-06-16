package com.uca.capas.domain;

public class Empleado {

	private Integer idEmpleado;
	private String nombre;
	private Integer edad;
	private Boolean genero;
	private Boolean estado;
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
	
	
}
