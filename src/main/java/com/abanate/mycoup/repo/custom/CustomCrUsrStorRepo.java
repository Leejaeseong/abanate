package com.abanate.mycoup.repo.custom;

import java.util.Map;

import com.abanate.mycoup.domain.CmUsr;

/**
 * 설명 : CustomCmUsrRepo.java 파일 참조
 */
public interface CustomCrUsrStorRepo {
	
	public Map<String, Long> findMycoupListSummaryByCmUsr( CmUsr cmUsr );
	
}