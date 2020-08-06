package com.abanate.mycoup.repo.custom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import com.abanate.com.util.ChkUtil;
import com.abanate.mycoup.domain.ChVisit;
import com.abanate.mycoup.domain.QChVisit;
import com.querydsl.core.Tuple;
import com.querydsl.jpa.JPQLQuery;

public class ChVisitRepoImpl extends QuerydslRepositorySupport implements CustomChVisitRepo {

	//private static final Logger log = CustomLogger.getLogger();

	public ChVisitRepoImpl() {
		super(ChVisit.class);
	}

	/*
	@Override
	public List<ChVisit> findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining(String fDt, String tDt,
			String usrId, String usrNm, int pageNo) {
		Pageable pageable = PageRequestCustom.of(pageNo, ConstUtil.PAGE_SIZE);

		QChVisit chVisit = QChVisit.chVisit;

		JPQLQuery<ChVisit> query = from(chVisit);

		// Set inner join.
		query.innerJoin(chVisit.cmUsr).fetchJoin();
		query.innerJoin(chVisit.cmStor).fetchJoin();

		// Set conditions.
		if (ChkUtil.chkNull(fDt)) {
			query.where(chVisit.visitDtm.between(fDt + "000000", tDt + "235959"));
		}
		if (ChkUtil.chkNull(usrId)) {
			query.where(chVisit.cmUsr.usrId.eq(usrId));
		}
		if (ChkUtil.chkNull(usrNm)) {
			query.where(chVisit.cmUsr.usrNm.like(usrNm));
		}

		// Apply pagination.
		List<ChVisit> list = getQuerydsl().applyPagination(pageable, query).fetch();

		return list;
	}
	*/

	@Override
	public Map<String, Object> findByCmStor_cmStorSeqAndVisitDtmBetweenAndCmUsr_usrIdContainingAndCmUsr_usrNmContainingAndCmUsr_natiCdSummary( Long cmStorSeq, String fDt, String tDt, String usrId, String usrNm, String natiCd ) {
		QChVisit chVisit = QChVisit.chVisit;

		JPQLQuery<ChVisit> query = from(chVisit);

		// Set conditions.
		query.where(chVisit.cmStor.cmStorSeq.eq( cmStorSeq ) );
		query.where(chVisit.cmUsr.natiCd.eq( natiCd ) );
		if (ChkUtil.chkNull(fDt)) {
			query.where(chVisit.visitDtm.between( ChkUtil.getMinDtm( fDt ), ChkUtil.getMaxDtm( tDt ) ));
		}
		if (ChkUtil.chkNull(usrId)) {
			query.where(chVisit.cmUsr.usrId.eq(usrId));
		}
		if (ChkUtil.chkNull(usrNm)) {
			query.where(chVisit.cmUsr.usrNm.like(usrNm));
		}
		
		// Alias is essential in aggregation projections.
		List<Tuple> tList =	query.select( chVisit.chVisitSeq.count()							.as("searchCnt") 	// Count all of the searched data.
										, chVisit.cmUsr.cmUsrSeq.countDistinct()				.as("usrCnt") 		// Count of customers.
										, chVisit.savAmt.sum()									.as("savAmt") 		// Sum of saved amounts.
										, chVisit.useAmt.sum()									.as("useAmt") 		// Sum of used amounts.
										, chVisit.savAmt.sum().subtract( chVisit.useAmt.sum() )	.as("accumAmt")		// Calculate the accumulated
		).fetch();
		
		return ChkUtil.getMapToListAndProjectionInfo( tList, query );
		/*
		for (Tuple tuple : tList) {
			rMap.put("searchCnt", tuple.get( 0, Long.class ) );
			rMap.put("usrCnt"	, tuple.get( 1, Long.class ) );
			rMap.put("savAmt"	, tuple.get( 2, Long.class ) );
			rMap.put("useAmt"	, tuple.get( 3, Long.class ) );
			rMap.put("accumAmt"	, tuple.get( 4, Long.class ) );
		}
		*/
		
		/* Grouping sample, and use projection as a Expression.
		List<Tuple> tList =	query.select( chVisit.chVisitSeq.count()							// Count all of the searched data.
										, chVisit.cmUsr.cmUsrSeq.countDistinct()				// Count of customers.
										, chVisit.savAmt.sum()									// Sum of saved amounts.
										, chVisit.useAmt.sum()									// Sum of used amounts.
										, chVisit.savAmt.sum().subtract( chVisit.useAmt.sum() )	// Calculate the accumulated
										, chVisit.chVisitSeq
		).groupBy( chVisit.chVisitSeq ).fetchResults().getResults();
		
		for (Tuple tuple : tList) {	// Loop as much as data count.
			rMap.put("searchCnt", tuple.get( 0, Long.class ) );
			rMap.put("usrCnt"	, tuple.get( 1, Long.class ) );
			rMap.put("savAmt"	, tuple.get( 2, Long.class ) );
			rMap.put("useAmt"	, tuple.get( 3, Long.class ) );
			rMap.put("accumAmt"	, tuple.get( 4, Long.class ) );
			rMap.put("Test"		, tuple.get( chVisit.chVisitSeq ) );
		}
		*/
		
		// Failed to convert into a map.
		//Map<String, Long> mmm = tList.stream().collect(
		//		  HashMap::new
		//		, (m,v)->m.put("searchCnt", v.get( 0, Long.class ) )
		//		, HashMap::putAll
		//);
		
		/* Not work properly. Only use indexes.
		for (Tuple tuple : tList) {
			rMap.put("searchCnt", tuple.get( 0, Long.class ) );
			rMap.put("usrCnt"	, tuple.get( 1, Long.class ) );
			rMap.put("savAmt"	, tuple.get( chVisit.savAmt ) );
			rMap.put("useAmt"	, tuple.get( chVisit.useAmt ) );
			rMap.put("accumAmt"	, tuple.get( chVisit.accumAmt ) );
		}
		*/
		
	}
	
	// Not used because getting accum point is directly possible at the CR_USR_STOR
	@Override
	public Map<String, Object> findByCmStor_cmStorSeqAndCmUsr_usrIdSummary( Long cmStorSeq, String usrId ) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		QChVisit chVisit = QChVisit.chVisit;

		JPQLQuery<ChVisit> query = from(chVisit);

		// Set conditions.
		query.where(chVisit.cmStor.cmStorSeq.eq( 	cmStorSeq 	) );
		query.where(chVisit.cmUsr.usrId.eq( 		usrId 		) );
		
		// Alias is useless.
		List<Tuple> tList =	query.select( chVisit.cmUsr.usrNm
										, chVisit.savAmt.sum().subtract( chVisit.useAmt.sum() )
		).groupBy( chVisit.cmUsr.usrNm ).fetchResults().getResults();
		
		for (Tuple tuple : tList) {
			rMap.put("usrNm"	, tuple.get( 0, String.class ) );
			rMap.put("accumAmt"	, tuple.get( 1, Long.class ) );			
		}
				
		return rMap;
	}
	
	
}