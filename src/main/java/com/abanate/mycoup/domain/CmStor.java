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
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

import org.springframework.data.jpa.repository.EntityGraph;

import com.abanate.com.domain.ComSuffixDomain;

@Entity
@SequenceGenerator( name= "CM_STOR_GENERATOR", sequenceName = "SQ_CM_STOR", initialValue = 1, allocationSize = 1 )
public class CmStor extends ComSuffixDomain{

	// Define for attributePaths' name in @EntityGraph.
	public final static String entityName = "cmStor";
	
	@Id @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "CM_STOR_GENERATOR" )
	private Long cmStorSeq;
	
	//@OneToMany(mappedBy = "cmStor")
	@Transient
	private List<CrUsrStor> crUsrStor = new ArrayList<CrUsrStor>();
	
	//@OneToMany(mappedBy = "cmStor")
	@Transient
	private List<CmGoos> cmGoos = new ArrayList<CmGoos>();
	
	//@OneToMany(mappedBy = "cmStor")
	@Transient
	private List<ChVisit> chVisit = new ArrayList<ChVisit>();
	
	private String 	storId;
	
	@NotBlank( message = "상호명이 입력되지 않았습니다" )
	@Size( min = 1, max = 64, message = "상호명 길이 오류" )
	private String 	storNm;
	
	@Size( min = 5, max = 30, message = "연락처는 전화번호 형식이어야 합니다" )
	//@Pattern( regexp = "()$|(\\d{2}|\\d{3})[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$", message = "연락처는 전화번호 형식이어야 합니다")
	@Pattern( regexp = "()$|^[0-9]{0,30}$", message = "연락처는 5~20자리 숫자 형식이어야 합니다")
	private String 	telNo;
	
	@Size( max = 128, message = "주소1 길이 오류" )
	private String 	addrPt1;
	@Size( max = 128, message = "주소2 길이 오류" )
	private String 	addrPt2;
	@Size( max = 128, message = "상세 주소 길이 오류" )
	private String 	addrDtl;
	@Pattern( regexp = "()$|^[0-9]{0,8}$", message = "우편번호는 숫자 8자 이하 형식이어야 합니다")
	private String 	zipCd;
	@NotBlank( message = "적립 구분이 입력되지 않았습니다" )
	@Pattern( regexp = "^[C|P]{1}$", message = "적립 구분이 올바르지 않습니다" )
	private String 	savTp;
	@PositiveOrZero( message = "적립량은 0 이상이어야 합니다")
	private Long 	savAmt;
	@PositiveOrZero( message = "적립제한량은 0 이상이어야 합니다")
	private Long 	savLimitAmt;
	@PositiveOrZero( message = "사용량은 0 이상이어야 합니다")
	private Long 	useAmt;
	@Size( max = 20, message = "지도 위도 길이 오류" )
	private String mapLat;
	@Size( max = 20, message = "지도 경도 길이 오류" )
	private String mapLng;
	
	public CmStor() {
	}
	
	public CmStor( long cmStorSeq ) {
		this.cmStorSeq = cmStorSeq;
	}
	
	public enum SavTp {
		C, P
	}
		
	// Set default values 
	@PrePersist
	public void prePersist(){
		if( savTp 			== null ) this.setSavTp			( "C" );
		if( savAmt 			== null ) this.setSavAmt		( 0L  );
		if( savLimitAmt 	== null ) this.setSavLimitAmt	( 0L  );
		if( useAmt 			== null ) this.setUseAmt		( 0L  );
	}
	
	@Override
	public String toString() {
		return "CmStor [cmStorSeq=" 	+ cmStorSeq
				   + ", crUsrStor=" 	+ crUsrStor
				   + ", cmGoos=" 		+ cmGoos
				   + ", chVisit=" 		+ chVisit
				   + ", storId=" 		+ storId
				   + ", storNm=" 		+ storNm
				   + ", telNo=" 		+ telNo
				   + ", addrPt1=" 		+ addrPt1
				   + ", addrPt2=" 		+ addrPt2
				   + ", addrDtl=" 		+ addrDtl
				   + ", zipCd=" 		+ zipCd
				   + ", savTp=" 		+ savTp
				   + ", savAmt=" 		+ savAmt
				   + ", savLimitAmt="	+ savLimitAmt
				   + ", useAmt=" 		+ useAmt
				   + ", mapLat=" 		+ mapLat
				   + ", mapLng=" 		+ mapLng
				   + "]";
	}

	public Long getCmStorSeq() {
		return cmStorSeq;
	}

	public void setCmStorSeq(Long cmStorSeq) {
		this.cmStorSeq = cmStorSeq;
	}

	public List<CrUsrStor> getCrUsrStor() {
		return crUsrStor;
	}

	public void setCrUsrStor(List<CrUsrStor> crUsrStor) {
		this.crUsrStor = crUsrStor;
	}

	public List<CmGoos> getCmGoos() {
		return cmGoos;
	}

	public void setCmGoos(List<CmGoos> cmGoos) {
		this.cmGoos = cmGoos;
	}

	public List<ChVisit> getChVisit() {
		return chVisit;
	}

	public void setChVisit(List<ChVisit> chVisit) {
		this.chVisit = chVisit;
	}

	public String getStorId() {
		return storId;
	}

	public void setStorId(String storId) {
		this.storId = storId;
	}

	public String getStorNm() {
		return storNm;
	}

	public void setStorNm(String storNm) {
		this.storNm = storNm;
	}

	public String getTelNo() {
		return telNo;
	}

	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}

	public String getAddrPt1() {
		return addrPt1;
	}

	public void setAddrPt1(String addrPt1) {
		this.addrPt1 = addrPt1;
	}

	public String getAddrPt2() {
		return addrPt2;
	}

	public void setAddrPt2(String addrPt2) {
		this.addrPt2 = addrPt2;
	}

	public String getAddrDtl() {
		return addrDtl;
	}

	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}

	public String getZipCd() {
		return zipCd;
	}

	public void setZipCd(String zipCd) {
		this.zipCd = zipCd;
	}

	public String getSavTp() {
		return savTp;
	}

	public void setSavTp(String savTp) {
		this.savTp = savTp;
	}

	public Long getSavAmt() {
		return savAmt;
	}

	public void setSavAmt(Long savAmt) {
		this.savAmt = savAmt;
	}

	public Long getSavLimitAmt() {
		return savLimitAmt;
	}

	public void setSavLimitAmt(Long savLimitAmt) {
		this.savLimitAmt = savLimitAmt;
	}

	public Long getUseAmt() {
		return useAmt;
	}

	public void setUseAmt(Long useAmt) {
		this.useAmt = useAmt;
	}

	public String getMapLat() {
		return mapLat;
	}

	public void setMapLat(String mapLat) {
		this.mapLat = mapLat;
	}

	public String getMapLng() {
		return mapLng;
	}

	public void setMapLng(String mapLng) {
		this.mapLng = mapLng;
	}

}