package com.abanate.mycoup.repo.custom;

import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import com.abanate.com.util.ChkUtil;

public class NqueryRepoImpl extends QuerydslRepositorySupport implements CustomNqueryRepo
{
	
	//private static final Logger log = CustomLogger.getLogger();
	
	public NqueryRepoImpl() {
		super( NqueryRepoImpl.class );
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String,Object>> findNativeQueryTest() {
		/*
		String sql = "SELECT U.USR_NM, V.CH_VISIT_SEQ "
					+"  FROM CH_VISIT V "
					+" INNER JOIN CM_USR U"
					+"   ON U.CM_USR_SEQ  = V.CM_USR_SEQ"
					+" INNER JOIN CM_STOR S"
					+"   ON S.CM_STOR_SEQ = V.CM_STOR_SEQ";
		Query query = getEntityManager().createNativeQuery( sql );
		*/
		//Query query = getEntityManager().createNativeQuery( "Mycoup.Test1", ChVisit.class );
		Query query = getEntityManager().createNamedQuery( "ChVisit.test" );
		//query.setParameter( "USR_NM", "미가입" );
		
		//query.setParameter( "USR_NM", "^이재성|^미가입" );
		ChkUtil.setNativeQueryParam( query, "USR_NM", "^이재성|^미가입" );
		
		// Convert result type from Object to Map.
		NativeQueryImpl<?> nativeQuery = (NativeQueryImpl<?>) query;
		nativeQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		
		return query.getResultList();
	}
	
}