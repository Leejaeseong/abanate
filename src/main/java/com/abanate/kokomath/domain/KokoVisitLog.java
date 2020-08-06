package com.abanate.kokomath.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.abanate.com.domain.ComSuffixDomain;

//@Entity
//@SequenceGenerator( name= "KOKO_VISIT_LOG_GENERATOR", sequenceName = "SQ_KOKO_VISIT_LOG", initialValue = 1, allocationSize = 1 )
//@Table(name = "KOKO_VISIT_LOG")
public class KokoVisitLog extends ComSuffixDomain {
	
	@Id
	@GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "KOKO_VISIT_LOG_GENERATOR" )
	@Column(name = "SEQ")
	private Long seq;
	
	@Column(name = "VISIT_PAGE")
	private String 	visitPage;
	
	@Column(name = "VISIT_DTM")
	private String 	visitDtm;
	
	@Column(name = "USR_ID")
	private String 	usrId;
	
	@Column(name = "USR_IP")
	private String 	usrIp;
	
	public Long getSeq() {
		return seq;
	}

	public void setSeq(Long seq) {
		this.seq = seq;
	}

	public String getVisitPage() {
		return visitPage;
	}

	public void setVisitPage(String visitPage) {
		this.visitPage = visitPage;
	}

	public String getVisitDtm() {
		return visitDtm;
	}

	public void setVisitDtm(String visitDtm) {
		this.visitDtm = visitDtm;
	}

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getUsrIp() {
		return usrIp;
	}

	public void setUsrIp(String usrIp) {
		this.usrIp = usrIp;
	}
	
}