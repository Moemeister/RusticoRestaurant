package com.uca.capas.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(schema= "public", name = "usuario")
public class User {

//	@Id
//	@GeneratedValue(generator="usuario_iduser_seq",strategy= GenerationType.AUTO)
//	@SequenceGenerator(name="usuario_iduser_seq",sequenceName="public.usuario_iduser_seq",allocationSize = 1)
//	private int idUser;
	@Id
	@Column(name = "usuario")
	private String user;
	
	@Column(name = "pass")
	private String pass;
	
//	public int getId() {
//		return idUser;
//	}
//	public void setId(int id) {
//		this.idUser = id;
//	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
}
