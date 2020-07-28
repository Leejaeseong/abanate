package com.abanate.mycoup.repo.custom;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;

import com.abanate.mycoup.domain.ChVisit;
import com.abanate.mycoup.domain.CmUsr;

/**
 * 설명 : CustomCmUsrRepo.java 파일 참조
 */
public interface CustomCrUsrStorRepo {
	
	public Map<String, Long> findMycoupListSummaryByCmUsr( CmUsr cmUsr );
	
}