package com.abanate.mycoup.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.mycoup.domain.ChGmap;

public interface ChGmapRepo extends JpaRepository<ChGmap, Long>, JpaSpecificationExecutor<ChGmap> {
	
	ChGmap findByMgrDt( String mgrDt );
	
}