package com.abanate.mycoup.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.abanate.mycoup.domain.ChGmap;

public interface ChGmapRepo extends JpaRepository<ChGmap, Long>, JpaSpecificationExecutor<ChGmap> {
	
	ChGmap findByMgrDt( String mgrDt );
	
	// @Modifying is necessary with DML operations in named query.
	//			  modifying annotation is to use bulk process. then ignore permanant context.
	//			  and set automatically clear true( default = false ), then apply to permanant context immediately.
	// @Transactional annotaion is necessary with modifying annotation.
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query( "UPDATE ChGmap a SET a.loadCnt = a.loadCnt + 1 WHERE a.mgrDt = ?1" )
	int saveLoadCntInc( String mgrDt );
	
}