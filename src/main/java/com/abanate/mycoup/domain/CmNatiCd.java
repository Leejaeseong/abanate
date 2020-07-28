package com.abanate.mycoup.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

import com.abanate.com.domain.ComSuffixDomain;

@Entity
@SequenceGenerator( name= "CM_NATI_CD_GENERATOR", sequenceName = "SQ_CM_NATI_CD", initialValue = 1, allocationSize = 1 )
public class CmNatiCd extends ComSuffixDomain{
	
	// Define for attributePaths' name in @EntityGraph.
	public final static String entityName = "cmNatiCd";
		
	@Id @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "CM_NATI_CD_GENERATOR" )
	private Long cmNatiCdSeq;
	
	@NotBlank( message = "국가코드가 입력되지 않았습니다" )
	@Size( min = 2, max = 2, message = "국가코드 길이 오류" )
	private String 	natiCd;
	
	@NotBlank( message = "국가명_한국어가 입력되지 않았습니다" )
	@Size( min = 1, max = 64, message = "국가명_한국어 오류" )
	private String 	natiNmKor;
	
	@NotBlank( message = "국가명_영어가 입력되지 않았습니다" )
	@Size( min = 1, max = 256, message = "국가명_영어 오류" )
	private String 	natiNmEng;
	
	// Set default values 
	@PrePersist
	public void prePersist(){
		
	}
	
	@Override
	public String toString() {
		return "CmNatiCd [cmNatiCdSeq="	+ cmNatiCdSeq 
				  + ", natiNmKor=" 		+ natiNmKor
				  + ", natiNmEng=" 		+ natiNmEng				  
				  + "]";
	}

	public Long getCmNatiCdSeq() {
		return cmNatiCdSeq;
	}

	public void setCmNatiCdSeq(Long cmNatiCdSeq) {
		this.cmNatiCdSeq = cmNatiCdSeq;
	}

	public String getNatiCd() {
		return natiCd;
	}

	public void setNatiCd(String natiCd) {
		this.natiCd = natiCd;
	}

	public String getNatiNmKor() {
		return natiNmKor;
	}

	public void setNatiNmKor(String natiNmKor) {
		this.natiNmKor = natiNmKor;
	}

	public String getNatiNmEng() {
		return natiNmEng;
	}

	public void setNatiNmEng(String natiNmEng) {
		this.natiNmEng = natiNmEng;
	}

}