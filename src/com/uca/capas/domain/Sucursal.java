package com.uca.capas.domain;

import java.sql.Time;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

public class Sucursal {

	@Id
	@GeneratedValue(generator = "sucursal_idsucursal_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "sucursal_idsucursal_seq", sequenceName = "public.sucursal_idsucursal_seq", allocationSize = 1)
	@Column(name = "idsuc")
	private Integer idSucursal;
	
	@Column(name = "nombre")
	private String sucursal;
	
	@Column(name = "ubicacion")
	private String ubicacion;
	
	@Column(name = "openschedule")
	private Time open;
	
	@Column(name = "closeschedule")
	private Time close;
	
	@Column(name = "nmesas")
	private Integer nMesas;
	
	@Column(name = "nomgerente")
	private String gerente;
	
	@OneToMany(mappedBy = "sucursal", fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.PERSIST)
	private List<Empleado> empleado;
	
	public Integer getIdSucursal() {
		return idSucursal;
	}
	public void setIdSucursal(Integer idSucursal) {
		this.idSucursal = idSucursal;
	}
	public String getSucursal() {
		return sucursal;
	}
	public void setSucursal(String sucursal) {
		this.sucursal = sucursal;
	}
	public String getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
	public Time getOpen() {
		return open;
	}
	public void setOpen(Time open) {
		this.open = open;
	}
	public Time getClose() {
		return close;
	}
	public void setClose(Time close) {
		this.close = close;
	}
	public Integer getnMesas() {
		return nMesas;
	}
	public void setnMesas(Integer nMesas) {
		this.nMesas = nMesas;
	}
	public String getGerente() {
		return gerente;
	}
	public void setGerente(String gerente) {
		this.gerente = gerente;
	}
	
	
}
