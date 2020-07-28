package com.abanate.mycoup.repo;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.domain.CrUsrStor;
import com.abanate.mycoup.repo.custom.CustomCrUsrStorRepo;

public interface CrUsrStorRepo extends JpaRepository<CrUsrStor, Long>, JpaSpecificationExecutor<CrUsrStor>, CustomCrUsrStorRepo {
	
	public Long countByCmStor( CmStor cmStor );
	
	@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	public CrUsrStor findByCmUsrAndCmStor( CmUsr cmUsr, CmStor cmStor );
	
	@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	public List<CrUsrStor> findByCmUsrAndAccumAmtGreaterThan( CmUsr cmUsr, Long amt );
	
	@EntityGraph(attributePaths = {CmUsr.entityName,CmStor.entityName})
	public CrUsrStor findByCmUsr_usrIdAndCmStor( String usrId, CmStor cmStor );
	
	public Long deleteByCmUsr( CmUsr cmUsr );
}