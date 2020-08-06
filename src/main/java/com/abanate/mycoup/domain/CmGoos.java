package com.abanate.mycoup.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.abanate.com.domain.ComSuffixDomain;

@Entity
@SequenceGenerator( name= "CM_GOOS_GENERATOR", sequenceName = "SQ_CM_GOOS", initialValue = 1, allocationSize = 1 )
public class CmGoos extends ComSuffixDomain{
	
	@Id @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "CM_GOOS_GENERATOR" )
	private Long cmGoosSeq;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CM_STOR_SEQ", nullable = false)
    private CmStor cmStor;      // 점포관리
	
	private String 	goosNm;
	private Long 	savAmt;
	
	@Override
	public String toString() {
		return "CmGoos [cmGoosSeq=" 	+ cmGoosSeq 
				   + ", cmStor.StorId=" + ( cmStor!=null?cmStor.getStorId():"" ) 
				   + ", goosNm=" 		+ goosNm 
				   + ", savAmt=" 		+ savAmt + "]";
	}
	
	public Long getCmGoosSeq() {
		return cmGoosSeq;
	}

	public void setCmGoosSeq(Long cmGoosSeq) {
		this.cmGoosSeq = cmGoosSeq;
	}

	public CmStor getCmStor() {
		return cmStor;
	}

	public void setCmStor(CmStor cmStor) {
		this.cmStor = cmStor;
	}

	public String getGoosNm() {
		return goosNm;
	}

	public void setGoosNm(String goosNm) {
		this.goosNm = goosNm;
	}

	public Long getSavAmt() {
		return savAmt;
	}

	public void setSavAmt(Long savAmt) {
		this.savAmt = savAmt;
	}


}