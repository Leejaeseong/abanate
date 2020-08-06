package com.abanate.mycoup.repo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.mycoup.domain.ChVisit;
import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.repo.custom.CustomChVisitRepo;

public interface ChVisitRepo extends JpaRepository<ChVisit, Long>, JpaSpecificationExecutor<ChVisit>, CustomChVisitRepo {
	
	@Override
	@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	public List<ChVisit> findAll();
	
	@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	public List<ChVisit> findByCmUsrAndCmStorOrderByChVisitSeqDesc( CmUsr cmUsr, CmStor cmStor );
		
	@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	public Page<ChVisit> findByCmUsrAndCmStorOrderByVisitDtmDescChVisitSeqDesc( CmUsr cmUsr, CmStor cmStor, Pageable pageable );
	
	//@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	//public List<ChVisit> findByVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining( CmUsr cmUsr, CmStor cmStor );
	
	@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	public List<ChVisit> findByCmStor_cmStorSeqAndVisitDtmBetweenAndCmUsr_usrIdContainingAndCmUsr_usrNmContainingAndCmUsr_natiCdOrderByChVisitSeqDesc( Long cmStorSeq, String fDt, String tDt, String usrId, String usrNm, String natiCd, Pageable pageable );
	
	@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	public List<ChVisit> findByCmUsr_usrIdAndCmStor_cmStorSeqOrderByVisitDtmDescChVisitSeqDesc( String usrId, Long cmStorSeq, Pageable pageable );
	
	public Long deleteByCmUsr( CmUsr cmUsr );
	
}