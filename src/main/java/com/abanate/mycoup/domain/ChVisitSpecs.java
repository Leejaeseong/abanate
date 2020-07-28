package com.abanate.mycoup.domain;

import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

/**
 * Not used class. ->  Use specification in the domain itself.
 * @author jaeseong_lee
 *
 */
public class ChVisitSpecs {

	public static Specification<ChVisit> usrNmLike() {
		
		//return ( (root, criteriaQuery, criteriaBuilder ) -> criteriaBuilder.equal(root.get("usrNm"), "aaa" ) );	
		
		//Root<ChVisit> root;
		//root.get(map)
		
		// Succeeded syntax
		return ( (root, criteriaQuery, criteriaBuilder ) -> criteriaBuilder.equal(root.get("useTp"), "U" ) );
		
		// return ( (root, criteriaQuery, criteriaBuilder ) -> criteriaBuilder.equal(root.get( QChVisit.chVisit.useTp.toString() ), "U" ) );
		
		
		
		//return ( (root, criteriaQuery, criteriaBuilder ) -> criteriaBuilder.equal(root.get(QChVisit.chVisit.cmUsr.usrNm), "aaa" ) );
		//return ( (root, criteriaQuery, criteriaBuilder ) -> criteriaBuilder.equal(root.get(QChVisit.chVisit.rmks), "aaa" ) );
		
		
		/*
		return new Specification<ChVisit>() {
			@Override
			public javax.persistence.criteria.Predicate toPredicate(Root<ChVisit> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				return null;
			}
			
		};
		 */
	}
	
}