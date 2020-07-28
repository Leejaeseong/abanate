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
@SequenceGenerator( name= "CM_USR_GENERATOR", sequenceName = "SQ_CM_USR", initialValue = 1, allocationSize = 1 )
public class CmUsr extends ComSuffixDomain{
	
	// Define for attributePaths' name in @EntityGraph.
	public final static String entityName = "cmUsr";
		
	@Id @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "CM_USR_GENERATOR" )
	private Long cmUsrSeq;
	
	//@OneToMany(mappedBy = "cmUsr")
	@Transient
    private List<CrUsrStor> crUsrStor = new ArrayList<CrUsrStor>();
	
	//@OneToMany(mappedBy = "cmUsr")
	@Transient
    private List<ChVisit> chVisit = new ArrayList<ChVisit>();

	@NotBlank( message = "ID가 입력되지 않았습니다" )
	@Size( min = 5, max = 30, message = "ID는 전화번호 형식이어야 합니다" )
	@Pattern( regexp = "()$|^[0-9]{0,30}$", message = "연락처는 5~30자리 숫자 형식이어야 합니다")
	//@Pattern( regexp = "(\\d{2}|\\d{3})[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$", message = "ID는 전화번호 형식이어야 합니다")
	private String 	usrId;
	
	@NotBlank( message = "사용자 구분이 입력되지 않았습니다" )
	@Pattern( regexp = "^[U|S]{1}$", message = "사용자 구분이 유효하지 않습니다" )
	private String 	usrTp;
	
	@NotBlank( message = "비밀번호가 입력되지 않았습니다" )
	@Size( min = 1, max = 512, message = "비밀번호 길이 오류" )
	private String 	passwd;
	
	@NotBlank( message = "성함이 입력되지 않았습니다" )
	@Size( min = 1, max = 64, message = "성함 길이 오류" )
	private String 	usrNm;
	
	@Email( message = "이메일 주소 형식을 확인해 주세요" )
	@Size( min = 1, max = 128, message = "이메일 주소 길이 오류" )
	private String 	email;
	
	@Size( min = 2, max = 2, message = "국적코드 길이 오류" )
	private String 	natiCd;
	
	@NotBlank( message = "마케팅 동의 여부가 입력되지 않았습니다" )
	@Pattern( regexp = "^[Y|N]{1}$", message = "마케팅 동의 여부가 유효하지 않습니다" )
	private String 	marketAgreeYn;
	
	@Pattern( regexp = "^[Y|N]{1}$", message = "가입 여부가 유효하지 않습니다" )
	private String 	joinYn;
	
	@Size( max = 512, message = "비밀번호 변경 토큰 길이 오류" )
	private String passwdChngToken;

	// Set default values 
	@PrePersist
	public void prePersist(){
		if( usrTp 			== null ) this.setUsrTp			( "U" );
		if( passwd 			== null ) this.setPasswd		( "*" );
		if( usrNm 			== null ) this.setUsrNm			( "미가입" );
		if( natiCd 			== null ) this.setNatiCd		( "KOR" );
		if( marketAgreeYn 	== null ) this.setMarketAgreeYn	( "N" );
		if( joinYn 			== null ) this.setJoinYn		( "Y" );
	}
	
	@Override
	public String toString() {
		return "CmUsr [cmUsrSeq="		+ cmUsrSeq 
				  + ", usrId=" 			+ usrId
				  + ", usrTp=" 			+ usrTp
				  + ", passwd=" 		+ passwd
				  + ", usrNm=" 			+ usrNm
				  + ", email=" 			+ email
				  + ", natiCd=" 		+ natiCd
				  + ", marketAgreeYn="	+ marketAgreeYn
				  + ", joinYn=" 		+ joinYn
				  + ", passwdChngToken="+ passwdChngToken
				  + "]";
	}


	public Long getCmUsrSeq() {
		return cmUsrSeq;
	}

	public void setCmUsrSeq(Long cmUsrSeq) {
		this.cmUsrSeq = cmUsrSeq;
	}

	public List<CrUsrStor> getCrUsrStor() {
		return crUsrStor;
	}

	public void setCrUsrStor(List<CrUsrStor> crUsrStor) {
		this.crUsrStor = crUsrStor;
	}

	public List<ChVisit> getChVisit() {
		return chVisit;
	}

	public void setChVisit(List<ChVisit> chVisit) {
		this.chVisit = chVisit;
	}

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getUsrTp() {
		return usrTp;
	}

	public void setUsrTp(String usrTp) {
		this.usrTp = usrTp;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUsrNm() {
		return usrNm;
	}

	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNatiCd() {
		return natiCd;
	}

	public void setNatiCd(String natiCd) {
		this.natiCd = natiCd;
	}

	public String getMarketAgreeYn() {
		return marketAgreeYn;
	}

	public void setMarketAgreeYn(String marketAgreeYn) {
		this.marketAgreeYn = marketAgreeYn;
	}

	public String getJoinYn() {
		return joinYn;
	}

	public void setJoinYn(String joinYn) {
		this.joinYn = joinYn;
	}

	public String getPasswdChngToken() {
		return passwdChngToken;
	}

	public void setPasswdChngToken(String passwdChngToken) {
		this.passwdChngToken = passwdChngToken;
	}
	
}