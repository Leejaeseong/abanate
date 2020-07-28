package com.abanate.kokomath.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.abanate.com.util.DateUtil;
import com.abanate.kokomath.domain.KokoMemberMgr;
import com.abanate.kokomath.domain.KokoVisitLog;

@Repository
public class KokoMathDao {

	@PersistenceContext
	EntityManager em;

	/**
	 * Save Visit history
	 * @param hashMap
	 */
	public void saveVisitLog( HashMap<String,Object> hashMap ) {
		Date date = DateUtil.getDate();
		KokoVisitLog kokoVisitLog = new KokoVisitLog();
		
		kokoVisitLog.setVisitPage( (String)hashMap.get( "visitPage" ) 	);
		kokoVisitLog.setVisitDtm( DateUtil.getDateTimeStrNoMark() );
		kokoVisitLog.setUsrIp( 	(String)hashMap.get( "userIp" ) 	);
		kokoVisitLog.setRegUsrId( 	"saveVisitLog" 					);
		kokoVisitLog.setRegUsrIp( 	(String)hashMap.get( "userIp" ) 	);
		kokoVisitLog.setRegPgmId( 	"수정해야함" 					);
		kokoVisitLog.setRegDttm( 	date 								);
		kokoVisitLog.setUpdPgmId( 	"수정해야함" 					);
		kokoVisitLog.setUpdUsrId( 	"saveVisitLog" 					);
		kokoVisitLog.setUpdUsrIp( 	(String)hashMap.get( "userIp" ) 	);
		kokoVisitLog.setUpdDttm( 	date 								);
		
        em.persist(kokoVisitLog);
    }
	
	/**
	 * Find Member
	 * @param usrId
	 * @return
	 */
	public KokoMemberMgr findOne(String usrId) {
        return em.find(KokoMemberMgr.class, usrId);
    }
	
	/**
	 * Find Member ( Login )
	 * @param usrId
	 * @return
	 */
	public KokoMemberMgr findOneLogin(String usrId, String passwd) {
		// 참고 : http://millky.com/@origoni/post/783		
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<KokoMemberMgr> criteriaQuery = criteriaBuilder.createQuery(KokoMemberMgr.class);
		Root<KokoMemberMgr> root = criteriaQuery.from(KokoMemberMgr.class);
		//Predicate restrictions = criteriaBuilder.equal(root.get("passwd"), passwd );
		Predicate[] restrictions = new Predicate[] {
			  criteriaBuilder.equal(root.get("usrId")	, usrId		)
			, criteriaBuilder.equal(root.get("passwd")	, passwd 	)
		};
		criteriaQuery.where(restrictions);
		TypedQuery<KokoMemberMgr> listQuery = em.createQuery(criteriaQuery);
		List<KokoMemberMgr> list = listQuery.getResultList();
		if( list.size() > 0 ) {
			return listQuery.getResultList().get( 0 );
		} else return null;
    }
	
	/**
	 * Save Member
	 * @param hashMap
	 */
	public void saveMember( KokoMemberMgr kokoMemberMgr ) {
		Date date = DateUtil.getDate();
	
		kokoMemberMgr.setRegUsrId	( "saveMember"	);
		kokoMemberMgr.setRegDttm	( date 			);
		kokoMemberMgr.setUpdUsrId	( "saveMember" 	);
		kokoMemberMgr.setUpdDttm	( date 			);
		
		em.persist(kokoMemberMgr);
    }
	
	/**
	 * Leave Member
	 * @param hashMap
	 */
	public void leaveMember( KokoMemberMgr kokoMemberMgr ) {
		KokoMemberMgr entity = em.find( KokoMemberMgr.class, kokoMemberMgr.getUsrId() );
		em.remove(entity);
	}
	
}