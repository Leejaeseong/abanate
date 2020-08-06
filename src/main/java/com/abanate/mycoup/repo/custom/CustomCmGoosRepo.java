package com.abanate.mycoup.repo.custom;

import java.util.List;

import com.abanate.mycoup.domain.CmGoos;

/**
 * 설명 : CustomCmUsrRepo.java 파일 참조
 */
public interface CustomCmGoosRepo {
	
	public List<CmGoos> search( long cmStorSeq );
	
}