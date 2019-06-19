package com.uca.capas.domain;

import java.sql.Time;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(schema="public", name="sucursal")
public class Sucursal {

	@Id
	@GeneratedValue(generator = "sucursal_idsuc_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "sucursal_idsuc_seq", sequenceName = "public.sucursal_idsuc_seq", allocationSize = 1)
	@Column(name = "idsuc")
	private Integer idSucursal;
	
	@Column(name = "nombre")
	private String sucursal;
	
	@Column(name = "ubicacion")
	private String ubicacion;
	
	@Column(name = "openschedule")
	private String open;
	
	@Column(name = "closeschedule")
	private String close;
	
	@Column(name = "nmesas")
	private Integer nMesas;
	
	@Column(name = "nomgerente")
	private String gerente;
	
	@OneToMany(mappedBy = "sucursal", fetch = FetchType.LAZY)
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
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
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
	public List<Empleado> getEmpleado() {
		return empleado;
	}
	public void setEmpleado(List<Empleado> empleado) {
		this.empleado = empleado;
	}
	
	
}
