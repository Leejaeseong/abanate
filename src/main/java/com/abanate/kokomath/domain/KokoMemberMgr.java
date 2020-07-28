package com.abanate.kokomath.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.abanate.com.domain.ComSuffixDomain;
import com.abanate.com.util.ConstUtil;

//@Entity
//@SequenceGenerator( name= "KOKO_MEMBER_MGR_GENERATOR", sequenceName = "SQ_KOKO_MEMBER_MGR", initialValue = 1, allocationSize = 1 )
//@Table(name = "KOKO_MEMBER_MGR")
public class KokoMemberMgr extends ComSuffixDomain{
	
	@Id
	@GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "KOKO_MEMBER_MGR_GENERATOR" )
	@Column(name = "SEQ")
	private Long seq;
	
	@Column(name = "USR_ID")
	private String 	usrId;
	
	@Column(name = "USR_NM")
	private String 	usrNm;
	
	@Column(name = "PASSWD")
	private String 	passwd;
	
	@Column(name = "EMAIL_ADDR")
	private String 	emailAddr;
	
	@Column(name = "GRADE")
	private String grade;
	
	@Column(name = "ADDR")
	private String addr;
	
	@Column(name = "MSG")
	private String msg;
	
	@Column(name = "REMK")
	private String remk;
	
	//==연관관계 메소드==//

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getUsrNm() {
		return usrNm;
	}

	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmailAddr() {
		return emailAddr;
	}

	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getRemk() {
		return remk;
	}

	public void setRemk(String remk) {
		this.remk = remk;
	}
	
}