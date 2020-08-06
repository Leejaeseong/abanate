package com.abanate.mycoup.repo.custom;

import com.abanate.mycoup.domain.CmUsr;

/**
 * 기본 JpaRepository만 사용하는 경우에는 필요 없음
 *
 * Implements가 있을때 CustomCmUsrRepo 구현을 CmUsrRepoImpl에서 해 줌
 * 
 * @author jaeseong_lee
 *
 */
public interface CustomCmUsrRepo {
	
	public CmUsr search( String usrId );
	
}