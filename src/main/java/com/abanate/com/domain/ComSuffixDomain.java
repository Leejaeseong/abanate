package com.abanate.com.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.abanate.com.util.ConstUtil;
import com.abanate.mycoup.domain.CmUsr;

@MappedSuperclass
public abstract class ComSuffixDomain {
	
	@Size( max = 128, message = "비고는 128글자 이하여야 합니다" )
	private String 	rmks;
	
	@Column(name = "REG_PGM_ID")
	private String 	regPgmId;
	
	@Column(name = "REG_USR_SEQ")
	private Long 	regUsrSeq;
	
	@Column(name = "REG_USR_IP")
	private String 	regUsrIp;
	
	@Column(name = "REG_DTTM")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern=ConstUtil.dateFormatHibernate)
	private Date 	regDttm;
	
	@Column(name = "UPD_PGM_ID")
	private String 	updPgmId;
	
	@Column(name = "UPD_USR_SEQ")
	private Long 	updUsrSeq;
	
	@Column(name = "UPD_USR_IP")
	private String 	updUsrIp;
	
	@Column(name = "UPD_DTTM")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern=ConstUtil.dateFormatHibernate)
	private Date 	updDttm;
	
	/** Set common column's values **/
	public void setComSuffix( HttpSession session, HttpServletRequest request) {
		if( this.getRegPgmId() == null || "".equals( this.getRegPgmId() ) ) {
			StackTraceElement[] stacktrace = Thread.currentThread().getStackTrace();
			StackTraceElement e = stacktrace[2];
			this.setRegPgmId( e.getClassName() + "->" + e.getMethodName() );
		}
		
		if( this.getUpdPgmId() == null || "".equals( this.getUpdPgmId() ) ) {
			StackTraceElement[] stacktrace = Thread.currentThread().getStackTrace();
			StackTraceElement e = stacktrace[2];
			this.setUpdPgmId( e.getClassName() + "->" + e.getMethodName() );
		}
		
		if( ( this.getRegUsrSeq() == null || "".equals( this.getRegUsrSeq() ) ) 
			&& session.getAttribute( "cmUsr" ) != null 
			&& ( (CmUsr)session.getAttribute( "cmUsr" ) ).getCmUsrSeq() != null && !"".equals( ( (CmUsr)session.getAttribute( "cmUsr" ) ).getCmUsrSeq() )
		) {
			this.setRegUsrSeq( ( (CmUsr)session.getAttribute( "cmUsr" ) ).getCmUsrSeq() );
		}
		if( ( this.getUpdUsrSeq() == null || "".equals( this.getUpdUsrSeq() ) ) 
				&& session.getAttribute( "cmUsr" ) != null 
				&& ( (CmUsr)session.getAttribute( "cmUsr" ) ).getCmUsrSeq() != null && !"".equals( ( (CmUsr)session.getAttribute( "cmUsr" ) ).getCmUsrSeq() )
				) {
			this.setUpdUsrSeq( ( (CmUsr)session.getAttribute( "cmUsr" ) ).getCmUsrSeq() );
		}
		
		if( ( this.getRegUsrIp() == null || "".equals( this.getRegUsrIp() ) ) 
			&& request.getLocalAddr() != null && !"".equals( request.getLocalAddr() ) 
		) {
			this.setRegUsrIp( request.getLocalAddr() );
		} else {
			this.setRegUsrIp( "0.0.0.0" );
		}
		if( ( this.getUpdUsrIp() == null || "".equals( this.getUpdUsrIp() ) ) && request.getLocalAddr() != null && !"".equals( request.getLocalAddr() ) ) {
			this.setUpdUsrIp( request.getLocalAddr() );
		} else {
			this.setUpdUsrIp( "0.0.0.0" );
		}
		
		if( this.getRegDttm() == null ){
			this.setRegDttm( new Date() );
		}
		
		this.setUpdDttm( new Date() );
		
	}
	
	public String getRmks() {
		return rmks;
	}

	public void setRmks(String rmks) {
		this.rmks = rmks;
	}
	public String getRegPgmId() {
		return regPgmId;
	}
	public void setRegPgmId(String regPgmId) {
		this.regPgmId = regPgmId;
	}
	public Long getRegUsrSeq() {
		return regUsrSeq;
	}
	public void setRegUsrSeq(Long regUsrSeq) {
		this.regUsrSeq = regUsrSeq;
	}
	public String getRegUsrIp() {
		return regUsrIp;
	}
	public void setRegUsrIp(String regUsrIp) {
		this.regUsrIp = regUsrIp;
	}
	public Date getRegDttm() {
		return regDttm;
	}
	public void setRegDttm(Date regDttm) {
		this.regDttm = regDttm;
	}
	public String getUpdPgmId() {
		return updPgmId;
	}
	public void setUpdPgmId(String updPgmId) {
		this.updPgmId = updPgmId;
	}
	public Long getUpdUsrSeq() {
		return updUsrSeq;
	}
	public void setUpdUsrSeq(Long updUsrSeq) {
		this.updUsrSeq = updUsrSeq;
	}
	public String getUpdUsrIp() {
		return updUsrIp;
	}
	public void setUpdUsrIp(String updUsrIp) {
		this.updUsrIp = updUsrIp;
	}
	public Date getUpdDttm() {
		return updDttm;
	}
	public void setUpdDttm(Date updDttm) {
		this.updDttm = updDttm;
	}
	

}