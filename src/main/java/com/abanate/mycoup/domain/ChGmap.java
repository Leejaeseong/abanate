package com.abanate.mycoup.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.abanate.com.domain.ComSuffixDomain;

@Entity
@SequenceGenerator( name= "CH_GMAP_GENERATOR", sequenceName = "SQ_CH_GMAP", initialValue = 1, allocationSize = 1 )
public class ChGmap extends ComSuffixDomain{
	
	// Define for attributePaths' name in @EntityGraph.
	public final static String entityName = "chGamp";
		
	@Id @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "CH_GMAP_GENERATOR" )
	private Long chGmapSeq;
	
	@NotBlank( message = "관리일자가 입력되지 않았습니다" )
	@Size( min = 8, max = 8, message = "관리일자 길이 오류" )
	private String mgrDt;
	
	@NotBlank( message = "로딩횟수가 입력되지 않았습니다" )
	private Long loadCnt;
	
	// Set default values 
	@PrePersist
	public void prePersist(){
		if( loadCnt == null ) this.setLoadCnt	( 0L );
	}
	
	@Override
	public String toString() {
		return "ChGmap [chGmapSeq="	+ chGmapSeq 
				  + ", mgrDt=" 		+ mgrDt
				  + ", loadCnt="	+ loadCnt				  
				  + "]";
	}

	public Long getChGmapSeq() {
		return chGmapSeq;
	}

	public void setChGmapSeq(Long chGmapSeq) {
		this.chGmapSeq = chGmapSeq;
	}

	public String getMgrDt() {
		return mgrDt;
	}

	public void setMgrDt(String mgrDt) {
		this.mgrDt = mgrDt;
	}

	public Long getLoadCnt() {
		return loadCnt;
	}

	public void setLoadCnt(Long loadCnt) {
		this.loadCnt = loadCnt;
	}

	public static String getEntityname() {
		return entityName;
	}

}