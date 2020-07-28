package com.abanate.mycoup.repo.custom;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import com.abanate.com.util.ChkUtil;
import com.abanate.com.util.CustomLogger;
import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.domain.QChVisit;
import com.abanate.mycoup.domain.QCmStor;
import com.abanate.mycoup.domain.QCmUsr;
import com.abanate.mycoup.domain.QCrUsrStor;
import com.querydsl.core.Tuple;
import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.jpa.JPQLQuery;

public class CmStorRepoImpl extends QuerydslRepositorySupport implements CustomCmStorRepo{
	
	private static final Logger log = CustomLogger.getLogger();
	
	public CmStorRepoImpl() {
		super( CmUsr.class );
	}

	@Override
	public Map<String, Object> findByStorIdContainingAndStorNmContaining( String usrId, String storId, String storNm, boolean isVisited, String sType, Pageable pageable ) {
		QCmUsr 						cmUsr 		= QCmUsr		.cmUsr		;
		QCmStor 					cmStor 		= QCmStor		.cmStor		;
		QCrUsrStor 					crUsrStor	= QCrUsrStor	.crUsrStor	;
		QChVisit 					chVisit 	= QChVisit		.chVisit	;
		List<Tuple> 				tList;

		//JPQLQuery<CrUsrStor> queryCrUsrStor = from(crUsrStor);
		//queryCrUsrStor.where( crUsrStor.cmUsr.usrId.eq( usrId ) );
		
		JPQLQuery<CmStor> query = from(cmStor);
				
		// Set schema joins.		
		if( isVisited || ChkUtil.chkNull( sType ) ) {	// inner join.
			query.innerJoin( crUsrStor 	).on( cmStor.cmStorSeq			.eq( crUsrStor.cmStor.cmStorSeq	) );
			query.innerJoin( cmUsr 		).on( crUsrStor.cmUsr.cmUsrSeq	.eq( cmUsr.cmUsrSeq 			) );
			query.innerJoin( chVisit	).on( cmStor.cmStorSeq			.eq( chVisit.cmStor.cmStorSeq 	) );
			
			query.where( cmUsr.usrId.eq( usrId ) );
		} else {			// left outer join.
			query.leftJoin( crUsrStor 	).on( cmStor.cmStorSeq			.eq( crUsrStor.cmStor.cmStorSeq	) );
			query.leftJoin( cmUsr 		).on( crUsrStor.cmUsr.cmUsrSeq	.eq( cmUsr.cmUsrSeq 			) );
			query.leftJoin( chVisit		).on( cmStor.cmStorSeq			.eq( chVisit.cmStor.cmStorSeq 	) );
		}
		
		// Set conditions.
		if( ChkUtil.chkNull( storId ) ) {
			query.where(cmStor.storId.eq( storId ) );			
		}
		if( ChkUtil.chkNull( storNm ) ) {
			query.where(cmStor.storNm.likeIgnoreCase( "%" + storNm + "%" ) );
		}
		
		if( ChkUtil.chkNull( sType ) && sType.equals( "coupon" ) ) { // My coupon click.
			query.where( cmStor.savTp.eq( CmStor.SavTp.C.toString() ) );
			query.where( crUsrStor.accumAmt.gt( 0 ) );
		} else if( ChkUtil.chkNull( sType ) && sType.equals( "point" ) ) { // My coupon click.
			query.where( cmStor.savTp.eq( CmStor.SavTp.P.toString() ) );
			query.where( crUsrStor.accumAmt.gt( 0 ) );
		}
		
		tList = query.select( cmStor.cmStorSeq
				, cmStor.storNm
				, cmStor.savTp
				, cmStor.telNo
				, cmStor.addrPt1
				, cmStor.addrPt2
				, cmStor.addrDtl
				, crUsrStor.accumAmt.max()	.as( "accumAmt" )
				, chVisit.visitDtm.max()	.as( "visitDtm" )
			).groupBy(
					  	cmStor.cmStorSeq
					  , cmStor.storNm
					  , cmStor.telNo
					  , cmStor.addrPt1
					  , cmStor.addrPt2
					  , cmStor.addrDtl
					 // , crUsrStor.accumAmt
			//).fetchResults().getResults();			
			).orderBy( chVisit.visitDtm.max().desc()
			).offset( pageable.getOffset()
			).limit( pageable.getPageSize() ).fetch();
		
		
		return ChkUtil.getMapToListAndProjectionInfo( tList, query );
		
		/*
		tList = query.select( cmStor.cmStorSeq
							, cmStor.storNm
							, cmStor.telNo
							, cmStor.addrPt1
							, cmStor.addrPt2
							, cmStor.addrDtl
							, crUsrStor.accumAmt
							, chVisit.visitDtm.max()
				).groupBy(
						  cmStor.cmStorSeq
//						, cmStor.storNm
//						, cmStor.telNo
//						, cmStor.addrPt1
//						, cmStor.addrPt2
//						, cmStor.addrDtl
//						, crUsrStor.accumAmt
				).fetchResults().getResults();
		*/
		
		/*
		query.select( cmStor.cmStorSeq 
					, cmStor.storNm
					, cmStor.telNo
					, cmStor.addrPt1
					, cmStor.addrPt2
					, cmStor.addrDtl
				 ).getMetadata().getProjection();
		*/
		
		/* Get metadata test that failed to get field names.
		JPQLQuery<Tuple> tuple = query.select(cmStor.cmStorSeq, cmStor.storNm);
		QueryMetadata meta = tuple.getMetadata();
		Expression<?> proj = meta.getProjection();
		*/
		
		/* Success to get tuple names.
		JPQLQuery<CmUsr> 	query2 		= from(cmUsr);
		query2.select( cmUsr.cmUsrSeq, cmUsr.usrId, cmUsr.usrNm );
		List list = query2.fetchResults().getResults();
		Object obj = list.get(0);
		
		QueryMetadata meta = query2.getMetadata();
		Expression<?> proj = meta.getProjection();
		
		QTuple qt = (QTuple)proj;
		qt.getArgs().forEach(x->System.out.println( "aaa = " + x.toString() ) );
		*/
		
		// Test1. JPQLQuery.transform start ------------------------------------------------------------------------------------
		// Failed. only found about group transform examples.
		//ResultTransformer<?> transformer = null;
		//query.transform(transformer);
		
		// End of Test1. JPQLQuery.transform ----------------------------------------------------------------------------------
		
		// Test2. Query.accept start ------------------------------------------------------------------------------------
		// Failed. accept method and visitor parameter might work as cluase.
		// Visitor<?,?> v;
		// query.accept(v);
		// End of Test2. JPQLQuery.accept -------------------------------------------------------------------------------
		
		// Test3. Pause :  Unwrap start ------------------------------------------------------------------------------------
		// https://vladmihalcea.com/why-you-should-use-the-hibernate-resulttransformer-to-customize-result-set-mappings/
		// Failed. deprecated, so test stream map.
		
		// Below source was deprecated, and not a way of use QuerydslRepositorySupport.
		//getEntityManager().createQuery( "SELECT u FROM CmUsr u" ).unwrap( org.hibernate.query.Query.class ).setResultTransformer( AliasToEntityMapResultTransformer.INSTANCE );
		
		//HibernateQuery query2 = new HibernateQuery(getEntityManager().unwrap(Session.class));
		//org.hibernate.Query hibQuery = query2.from(cmUsr);
		//hibQuery.setResultTransformer(null);
		
		// End of Test. Unwrap -------------------------------------------------------------------------------
		
		// Test4. stream start ------------------------------------------------------------------------------------
		//Query stream : https://stackoverflow.com/questions/38240015/how-to-use-setresulttransformer-after-hibernate-5-2
		/*Failed, because converting into map costs one more resource wasting step.
		JPQLQuery<CmUsr> query2 = from(cmUsr);
		JPQLQuery<Tuple> tuple = query2.select(cmUsr.cmUsrSeq, cmUsr.usrId, cmUsr.usrNm );
		//List<Object> obj = tuple.fetch().stream().collect( Collectors.toList());
		
		Stream<Tuple> stream = tuple.fetch().parallelStream();
		//stream.map((x) ->{return x.toString();}).forEach(x->log.error(x.toString()));
		//stream.forEach( tp -> System.out.println( tp.get( cmUsr.cmUsrSeq ) + ", " + tp.get( cmUsr.usrId ) + ", " + tp.get( cmUsr.usrNm ) ) );
		*/
		
		// End of Test. stream -------------------------------------------------------------------------------
		
		//QueryImpl<?> qi = (QueryImpl<?>)query;
		
		//CriteriaQueryTypeQueryAdapter c = new CriteriaQueryTypeQueryAdapter( (SessionImplementor) getEntityManager(), (QueryImplementor)query, null);
		//c.setResultTransformer( AliasToEntityMapResultTransformer.INSTANCE );
		
		/*
		TypedQuery<CmUsr> tq = getEntityManager().createQuery( "SELECT m FROM CmUsr m", CmUsr.class );		
		
		CriteriaQueryTypeQueryAdapter<CmUsr> cc = (CriteriaQueryTypeQueryAdapter)tq;
		cc.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		
		QueryMetadata meta = query.getMetadata();
		Expression<?> proj = meta.getProjection();
		QTuple qt = (QTuple)proj;
		qt.getArgs().forEach(x->System.out.println( "aaa = " + x.toString() ) );
		Object obj = qt.getArgs().get(7);
		*/
		
		//StringOperation oo = (StringOperation)qt.getArgs().get(6);
				
		/* Pause : doing fetchablequery test.
		FetchableQuery query3    = from(cmUsr);
		query3.select(cmUsr.cmUsrSeq, cmUsr.usrId, cmUsr.usrNm );
		//QueryResults qr = query3.fetchResults();
		
		List list = query3.fetch();
		QTuple qt = (QTuple)list.get(0);
		List ep = qt.getArgs();
		//query2.transform(  );
		
		//query2.transform(transformer)
		//tuple.transform(transformer)
		*/
		
		/*
		for (Tuple tuple : tList) {
			rMap = new HashMap<String, Object>();
			rMap.put( "cmStorSeq"	, tuple.get( cmStor.cmStorSeq 	) );
			rMap.put( "storNm"		, tuple.get( cmStor.storNm 		) );
			rMap.put( "telNo"		, tuple.get( cmStor.telNo 		) );
			rMap.put( "addrPt1"		, tuple.get( cmStor.addrPt1 	) );
			rMap.put( "addrPt1"		, tuple.get( cmStor.addrPt1 	) );
			rMap.put( "addrDtl"		, tuple.get( cmStor.addrDtl 	) );
			rMap.put( "accumAmt"	, tuple.get( crUsrStor.accumAmt	) );
			rMap.put( "visitDtm"	, tuple.get( 7, Long.class 		) );
			rList.add( rMap );
		}
		*/
		
		/*
		query.where(chVisit.cmUsr.usrId.eq( 		storId 		) );
		
		// Alias is useless.
		List<Tuple> tList =	query.select( chVisit.cmUsr.usrNm
										, chVisit.savAmt.sum().subtract( chVisit.useAmt.sum() )
		).groupBy( chVisit.cmUsr.usrNm ).fetchResults().getResults();
		
		for (Tuple tuple : tList) {
			rMap.put("usrNm"	, tuple.get( 0, String.class ) );
			rMap.put("accumAmt"	, tuple.get( 1, Long.class ) );
		}
		*/
				
	}

}