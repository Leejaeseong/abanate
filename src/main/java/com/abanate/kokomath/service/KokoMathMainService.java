package com.abanate.kokomath.service;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abanate.com.util.DateUtil;
import com.abanate.kokomath.dao.KokoMathDao;
import com.abanate.kokomath.domain.KokoMemberMgr;
import com.abanate.kokomath.domain.KokoVisitLog;
import com.abanate.kokomath.repo.KokoMemberMgrRepo;
import com.abanate.kokomath.repo.KokoVisitLogRepo;

@Service
@Transactional /** RuntimeException과 그 자식들인 언체크(Unchecked) 예외만 롤백한다. 만약 체크 예외가 발생해도 롤백하고 싶다면 rollbackFor로 Exception 지정 */
public class KokoMathMainService {
	
	@Autowired
	KokoMathDao kokoMathDao;
	
	@Autowired
	KokoVisitLogRepo kokoVisitLogRepo;
	
	@Autowired
	KokoMemberMgrRepo kokoMemberMgrRepo;
	
	public void saveVisitLogJpa( HashMap<String,Object> hashMap ) {
		Date date = DateUtil.getDate();
		KokoVisitLog kokoVisitLog = new KokoVisitLog();
		
		kokoVisitLog.setVisitPage( (String)hashMap.get( "visitPage" ) 	);
		kokoVisitLog.setVisitDtm( DateUtil.getDateTimeStrNoMark() 			);
		kokoVisitLog.setUsrIp( 	(String)hashMap.get( "userIp" ) 		);
		kokoVisitLog.setRegUsrId( 	"saveVisitLog" 						);
		kokoVisitLog.setRegUsrIp( 	(String)hashMap.get( "userIp" ) 	);
		kokoVisitLog.setRegPgmId( 	"수정해야함123" 					);
		kokoVisitLog.setRegDttm( 	date 								);
		kokoVisitLog.setUpdPgmId( 	"수정해야함321" 					);
		kokoVisitLog.setUpdUsrId( 	"saveVisitLog" 						);
		kokoVisitLog.setUpdUsrIp( 	(String)hashMap.get( "userIp" ) 	);
		kokoVisitLog.setUpdDttm( 	date 								);
		
		kokoVisitLogRepo.save( kokoVisitLog );        
	}
	
	/**
	 * Save visit history
	 * @param HashMap
	 */
	public void saveVisitLog( HashMap<String,Object> hashMap ) {
		//kokoMathDao.saveVisitLog( hashMap );
	}
	
	/**
     * Find Member
     * @param id : 아이디
	 * @return KokoMathMemberMgr
     */
    public KokoMemberMgr getMemberMgr( String id ) {
    	KokoMemberMgr kokoMemberMgr = kokoMathDao.findOne( id );
    	return null;
    }
    
    /**
     * Find Member
     * @param id  : 아이디
     * 		  pwd : 비밀번호
     * @return KokoMathMemberMgr
     */
    public KokoMemberMgr getMemberMgrLogin( String id, String pwd ) {
    	//KokoMemberMgr kokoMemberMgr = kokoMathDao.findOneLogin( id, pwd );
    	
    	KokoMemberMgr kokoMemberMgr = kokoMemberMgrRepo.search( id, pwd );
    	
    	return kokoMemberMgr;
    }
    
    /**
	 * Save Member
	 * @param HashMap
	 */
	public void saveRegister( KokoMemberMgr kokoMemberMgr ) {
		kokoMathDao.saveMember( kokoMemberMgr );
	}
	
	/**
	 * Leave Member
	 * @param HashMap
	 */
	public void leaveMember( KokoMemberMgr kokoMemberMgr ) {
		kokoMathDao.leaveMember( kokoMemberMgr );
	}
    
}