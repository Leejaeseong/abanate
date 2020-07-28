package com.abanate.mycoup.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.mycoup.domain.CmGoos;
import com.abanate.mycoup.domain.CmNatiCd;

public interface CmNatiCdRepo extends JpaRepository<CmNatiCd, Long>, JpaSpecificationExecutor<CmGoos> {
	
}