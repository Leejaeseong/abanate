package com.abanate.mycoup.repo;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.com.util.ChkUtil;
import com.abanate.mycoup.domain.CmGoos;
import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.QCmGoos;
import com.abanate.mycoup.domain.QCmStor;
import com.abanate.mycoup.repo.custom.CustomCmGoosRepo;

public interface CmGoosRepo extends JpaRepository<CmGoos, Long>, JpaSpecificationExecutor<CmGoos>, CustomCmGoosRepo {
	
	@EntityGraph(attributePaths = { CmStor.entityName })
	List<CmGoos> 	findAllByCmStorOrderBySavAmtAsc( CmStor cmStor );
	
	@EntityGraph(attributePaths = { CmStor.entityName })
	CmGoos 			findAllByCmStorAndSavAmt( CmStor cmStor, long savAmt );

}