package com.abanate.mycoup.repo.custom;

import java.util.Map;

/**
 * 설명 : CustomCmUsrRepo.java 파일 참조
 */
public interface CustomChVisitRepo {
	
	//@Query("select chVisit from ChVisit chVisit join fetch chVisit.cmUsr")
	
	// It works but uses only the method name.
	//public List<ChVisit> 	findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining( String fDt, String tDt, String usrId, String usrNm, int pageNo );
	
	public Map<String,Object> findByCmStor_cmStorSeqAndVisitDtmBetweenAndCmUsr_usrIdContainingAndCmUsr_usrNmContainingAndCmUsr_natiCdSummary( Long cmStorSeq, String fDt, String tDt, String usrId, String usrNm, String natiCd );
	
	public Map<String,Object> findByCmStor_cmStorSeqAndCmUsr_usrIdSummary( Long cmStorSeq, String cmUsrId );
	
}