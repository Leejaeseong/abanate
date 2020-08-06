package com.abanate.kokomath.repo;

import com.abanate.kokomath.domain.KokoMemberMgr;

public interface KokoMemberMgrRepoI {
	
	public KokoMemberMgr search( String id, String pw );
}