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
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@SuppressWarnings("deprecation")
@Entity
@Table(schema="public", name="sucursal")
public class Sucursal {

	//@NotEmpty(message = "ingrese el nombre de la sucursal")
	@Id
	@GeneratedValue(generator = "sucursal_idsuc_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "sucursal_idsuc_seq", sequenceName = "public.sucursal_idsuc_seq", allocationSize = 1)
	@Column(name = "idsuc")
	private Integer idSucursal;
	
	@NotEmpty(message = "ingrese el nombre de la sucursal")
	@Column(name = "nombre")
	private String sucursal;
	
	@NotEmpty(message = "ingrese la ubicacion")
	@Column(name = "ubicacion")
	private String ubicacion;
	
	@NotEmpty(message = "ingrese la hora de entrada")
	@Column(name = "openschedule")
	private String open;
	
	@NotEmpty(message = "ingrese la hora de salida")
	@Column(name = "closeschedule")
	private String close;
	
	@NotNull(message = "ingrese la cantidad de mesas")
	@Column(name = "nmesas") 
	private Integer nMesas;
	
	@NotEmpty(message = "ingrese el nombre del gerente")
	@Column(name = "nomgerente")
	private String gerente;
	
	@OneToMany(mappedBy = "sucursal", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Empleado> empleado;
	
	
	
	public Sucursal() {
		super();
	}
	
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
