package com.abanate.kokomath.domain;

import javax.persistence.Column;
import javax.persistence.Id;

//@Entity
//@Table(name = "KOKO_TEST1")
public class KokoTest1{
	
	@Id
	@Column(name = "TEST1")
	private String test1;

	public String getTest1() {
		return test1;
	}

	public void setTest1(String test1) {
		this.test1 = test1;
	}
	
}