package com.abanate.mycoup.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.repo.custom.CustomCmStorRepo;

public interface CmStorRepo extends JpaRepository<CmStor, Long>, JpaSpecificationExecutor<CmStor>, CustomCmStorRepo { 
		
	CmStor findByStorId( String storId );
	
	List<CmStor> findByMapLatBetweenAndMapLngBetween( String mapLatFrom, String mapLatTo, String mapLngFrom, String mapLngTo );
}