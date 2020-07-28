package com.abanate.mycoup.repo.custom;

import org.slf4j.Logger;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import com.abanate.com.util.CustomLogger;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.domain.QCmUsr;
import com.querydsl.jpa.JPQLQuery;

public class CmUsrRepoImpl extends QuerydslRepositorySupport implements CustomCmUsrRepo{
	
	private static final Logger log = CustomLogger.getLogger();
	
	public CmUsrRepoImpl() {
		super( CmUsr.class );
	}

	@Override
	public CmUsr search( String usrId ) {
		QCmUsr cmUsr = QCmUsr.cmUsr;
		
		JPQLQuery<CmUsr> query = from( cmUsr );
		
		query.where( cmUsr.usrId.eq( usrId ) );
	
		log.info( "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" );
		log.info( "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" );
		log.info( "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" );
		
		//return (KokoMemberMgr)query.list( mem ).get( 0 );
		return query.fetchOne();

	}

}