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
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import com.abanate.com.domain.ComSuffixDomain;
import com.abanate.com.util.DateUtil;

@Entity
//@NamedNativeQuery(name = "ChVisit.Test",query = "select * from CH_VISIT")
@SequenceGenerator( name= "CH_VISIT_GENERATOR", sequenceName = "SQ_CH_VISIT", initialValue = 1, allocationSize = 1 )
public class ChVisit extends ComSuffixDomain{
	
	@Id @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "CH_VISIT_GENERATOR" )
	private Long chVisitSeq;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CM_USR_SEQ", nullable = false)	
    private CmUsr cmUsr;	// 사용자관리
	
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CM_STOR_SEQ", nullable = false)
    private CmStor cmStor;	// 점포관리
	
	private String 	visitDtm;
	@NotBlank( message = "사용 구분이 입력되지 않았습니다" )
	@Pattern( regexp = "^[U|S]{1}$", message = "사용 구분이 유효하지 않습니다" )
	private String  useTp;
	private Long 	savAmt;
	private Long 	useAmt;
	private Long 	accumAmt;
	private String 	goosNm;
	
	// Set default values 
	@PrePersist
	public void prePersist(){
		if( visitDtm	== null ) this.setVisitDtm	( DateUtil.getDateTimeStrNoMark() );
		if( savAmt 		== null ) this.setSavAmt	( 0L );
		if( useAmt 		== null ) this.setUseAmt	( 0L );
		if( accumAmt	== null ) this.setAccumAmt	( 0L );
	}
	
	/*
	public Specification<ChVisit> toSpecification() {
	
		// Failed syntax.
		//return ( (root, criteriaQuery, criteriaBuilder ) -> criteriaBuilder.equal(root.get( useTp.getClass().getFields()[0].getName() ), "U" ) );
		
		// Succeeded syntax.
		//return ( (root, criteriaQuery, criteriaBuilder ) -> criteriaBuilder.equal(root.get( ChkUtil.getVarName( QChVisit.chVisit.useTp ) ), "U" ) );
		//return ( (root, criteriaQuery, criteriaBuilder ) -> criteriaBuilder.equal(root.get( "useTp" ), "U" ) );
		
		// Succeeded syntax.
		//CmUsr cmUsr = new CmUsr();
		//cmUsr.setCmUsrSeq( 226L );		
		//return ( (root, query, cb ) -> (cb.equal(root.get( "cmUsr" ), cmUsr ) ) );		
		
		// Failed syntax.
		CmUsr cmUsr = new CmUsr();
		cmUsr.setUsrNm( "이재성" );		
		return ( (root, query, cb ) -> (cb.equal(root.get( "cmUsr" ), cmUsr ) ) );
    }
	*/
	
	@Override
	public String toString() {
		return "ChVisit [chVisitSeq=" 		+ chVisitSeq 
					+ ", cmUsr.usrId=" 		+ ( cmUsr	!=null ? cmUsr.getUsrId()	:"" )
					+ ", cmStor.storId="	+ ( cmStor	!=null ? cmStor.getStorId()	:"" )
					+ ", visitDtm="			+ visitDtm 
					+ ", useTp=" 			+ useTp
					+ ", savAmt=" 			+ savAmt
					+ ", useAmt=" 			+ useAmt
					+ ", accumAmt=" 		+ accumAmt
					+ ", goosNm=" 			+ goosNm + "]";
	}

	public Long getChVisitSeq() {
		return chVisitSeq;
	}

	public void setChVisitSeq(Long chVisitSeq) {
		this.chVisitSeq = chVisitSeq;
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

	public String getVisitDtm() {
		return visitDtm;
	}

	public void setVisitDtm(String visitDtm) {
		this.visitDtm = visitDtm;
	}

	public String getUseTp() {
		return useTp;
	}

	public void setUseTp(String useTp) {
		this.useTp = useTp;
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

	public String getGoosNm() {
		return goosNm;
	}

	public void setGoosNm(String goosNm) {
		this.goosNm = goosNm;
	}
	
}