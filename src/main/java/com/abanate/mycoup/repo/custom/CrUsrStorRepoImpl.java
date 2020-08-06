package com.abanate.mycoup.repo.custom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.domain.CrUsrStor;
import com.abanate.mycoup.domain.QCrUsrStor;
import com.querydsl.core.Tuple;
import com.querydsl.jpa.JPQLQuery;

public class CrUsrStorRepoImpl extends QuerydslRepositorySupport implements CustomCrUsrStorRepo {

	//private static final Logger log = CustomLogger.getLogger();

	public CrUsrStorRepoImpl() {
		super(CrUsrStor.class);
	}

	@Override
	public Map<String, Long> findMycoupListSummaryByCmUsr( CmUsr cmUsr ) {
		Map<String, Long> rMap = new HashMap<String, Long>();
		QCrUsrStor crUsrStor = QCrUsrStor.crUsrStor;
		
		JPQLQuery<CrUsrStor> query = from(crUsrStor);
		
		// Set conditions.
		query.where(crUsrStor.cmUsr.eq( cmUsr ) );		
		
		// Alias is useless.
		List<Tuple> tList =	query.select( 
												crUsrStor.cmStor.savTp
											,	crUsrStor.accumAmt.sum()											
										).groupBy( crUsrStor.cmStor.savTp ).fetchResults().getResults();
		
		for (Tuple tuple : tList) {
			if( 		tuple.get( crUsrStor.cmStor.savTp ).equals( CmStor.SavTp.C.toString() ) ) {	// Coupon.
				rMap.put("coupon"	, tuple.get( 1, Long.class ) );
			} else if( 	tuple.get( crUsrStor.cmStor.savTp ).equals( CmStor.SavTp.P.toString() ) ) {	// Point.
				rMap.put("point"	, tuple.get( 1, Long.class ) );
			}
		}
		
		return rMap;
	}
	
}