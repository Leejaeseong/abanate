package com.abanate.mycoup.repo.custom;

import java.util.Map;

import org.springframework.data.domain.Pageable;

/**
 * 설명 : CustomCmUsrRepo.java 파일 참조
 */
public interface CustomCmStorRepo {
	
	Map<String,Object> findByTelNoContainingAndStorNmContainingAndNatiCd( String usrId, String telNo, String storNm, String natiCd, boolean isVisited, String sType, Pageable pageable );
	
}