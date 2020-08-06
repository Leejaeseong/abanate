package com.abanate.mycoup.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.repo.custom.CustomCmUsrRepo;

public interface CmUsrRepo extends JpaRepository<CmUsr, Long>, JpaSpecificationExecutor<CmUsr>, CustomCmUsrRepo {
	
	// Remove function, because CmUsr's key is not used independently but with natiCd.
	//CmUsr findByUsrId( String usrId );
	
	CmUsr findByUsrIdAndNatiCd( String usrId, String natiCd );
	CmUsr findByUsrIdAndPasswdAndNatiCdAndJoinYn( String usrId, String passwd, String natiCd, String joinYn );
	CmUsr findByUsrIdAndPasswdAndNatiCd( String usrId, String passwd, String natiCd );	
	CmUsr findByUsrIdAndNatiCdAndPasswdChngToken( String usrId, String natiCd, String passwdChngToken );	
	List<CmUsr> findByUsrIdAndNatiCdOrEmailIgnoreCase( String usrId, String natiCd, String email );
	
}