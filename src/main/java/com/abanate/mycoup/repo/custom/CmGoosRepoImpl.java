package com.abanate.mycoup.repo.custom;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import com.abanate.com.util.CustomLogger;
import com.abanate.mycoup.domain.CmGoos;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.domain.QCmGoos;
import com.querydsl.jpa.JPQLQuery;

public class CmGoosRepoImpl extends QuerydslRepositorySupport implements CustomCmGoosRepo{
	
	private static final Logger log = CustomLogger.getLogger();
	
	public CmGoosRepoImpl() {
		super( CmGoos.class );
	}

	@Override
	public List<CmGoos> search( long cmStorSeq ) {
		QCmGoos cmGoos = QCmGoos.cmGoos;
		
		JPQLQuery<CmGoos> query = from( cmGoos );
		
		query.where( cmGoos.cmStor.cmStorSeq.eq( cmStorSeq ) );
	
		List<CmGoos> list = query.fetch();
		
		if( list.size() > 0 ) {
			org.hibernate.Hibernate.initialize( list.get( 0 ).getCmStor() );	// Initialize forced, because cmGoos.cmStor defined LAZY
		}
		
		return list;

	}
}