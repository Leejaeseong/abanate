package com.abanate.kokomath.repo.custom;

import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import com.abanate.kokomath.domain.KokoMemberMgr;
import com.abanate.kokomath.domain.QKokoMemberMgr;
import com.abanate.kokomath.repo.KokoMemberMgrRepoI;
import com.querydsl.jpa.JPQLQuery;

public class KokoMemberMgrRepoImpl extends QuerydslRepositorySupport implements KokoMemberMgrRepoI{
	
	public KokoMemberMgrRepoImpl() {
		super( KokoMemberMgr.class );
	}

	@Override
	public KokoMemberMgr search( String id, String pw ) {
		QKokoMemberMgr mem = QKokoMemberMgr.kokoMemberMgr;
		
		JPQLQuery<KokoMemberMgr> query = from( mem );
		
		query.where( mem.usrId.eq( id ) );
		query.where( mem.passwd.eq( pw ) );
		
		System.out.println( "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" );
		System.out.println( "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" );
		System.out.println( "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" );
		
		//return (KokoMemberMgr)query.list( mem ).get( 0 );
		return (KokoMemberMgr)query.fetchOne();
		

	}

}