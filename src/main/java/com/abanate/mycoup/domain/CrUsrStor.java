package com.abanate.mycoup.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.PositiveOrZero;

import com.abanate.com.domain.ComSuffixDomain;

@Entity
@SequenceGenerator( name= "CR_USR_STOR_GENERATOR", sequenceName = "SQ_CR_USR_STOR", initialValue = 1, allocationSize = 1 )
public class CrUsrStor extends ComSuffixDomain{
	
	@Id @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "CR_USR_STOR_GENERATOR" )
	private Long crUsrStorSeq;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CM_USR_SEQ", nullable = false)
    private CmUsr cmUsr;      // 사용자관리
	
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CM_STOR_SEQ", nullable = false)
    private CmStor cmStor;      // 점포관리
	
    @PositiveOrZero( message = "적립량은 0 이상이어야 합니다")
	private Long 	savAmt;
    
    @PositiveOrZero( message = "사용량은 0 이상이어야 합니다")
	private Long 	useAmt;
    
    @PositiveOrZero( message = "누적량은 0 이상이어야 합니다")
	private Long 	accumAmt;
	
    // Set default values 
 	@PrePersist
 	public void prePersist(){
 		if( accumAmt == null ) this.setAccumAmt( 0L );
 	}
 	
 	@Override
 	public String toString() {
 		return "CrUsrStor [crUsrStorSeq="	+ crUsrStorSeq
 					  + ", cmUsr=" 			+ cmUsr 
 					  + ", cmStor=" 		+ cmStor 
 					  + ", savAmt=" 		+ savAmt 
 					  + ", useAmt=" 		+ useAmt 
 					  + ", accumAmt=" 		+ accumAmt + "]";
 	}
 	
	public CmUsr getCmUsr() {
		return cmUsr;
	}

	public void setCmUsr(CmUsr cmUsr) {
		this.cmUsr = cmUsr;
	}

	public CmStor getCmStor() {
		return cmStor;
	}

	public void setCmStor(CmStor cmStor) {
		this.cmStor = cmStor;
	}

	public Long getCrUsrStorSeq() {
		return crUsrStorSeq;
	}

	public void setCrUsrStorSeq(Long crUsrStorSeq) {
		this.crUsrStorSeq = crUsrStorSeq;
	}

	public Long getSavAmt() {
		return savAmt;
	}

	public void setSavAmt(Long savAmt) {
		this.savAmt = savAmt;
	}

	public Long getUseAmt() {
		return useAmt;
	}

	public void setUseAmt(Long useAmt) {
		this.useAmt = useAmt;
	}

	public Long getAccumAmt() {
		return accumAmt;
	}

	public void setAccumAmt(Long accumAmt) {
		this.accumAmt = accumAmt;
	}

}