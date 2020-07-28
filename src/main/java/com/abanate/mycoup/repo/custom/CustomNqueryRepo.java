package com.abanate.mycoup.repo.custom;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;

import com.abanate.mycoup.domain.ChVisit;

/**
 * 설명 : CustomCmUsrRepo.java 파일 참조
 */
public interface CustomNqueryRepo {
	
	public List<Map<String,Object>> findNativeQueryTest();
	
}