package com.abanate.mycoup.service;

import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abanate.com.util.ChkUtil;
import com.abanate.com.util.ConstUtil;
import com.abanate.com.util.DateUtil;
import com.abanate.com.util.SecureUtil;
import com.abanate.com.util.SendMail;
import com.abanate.com.web.ComException;
import com.abanate.mycoup.domain.ChVisit;
import com.abanate.mycoup.domain.CmGoos;
import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.domain.CrUsrStor;
import com.abanate.mycoup.repo.ChVisitRepo;
import com.abanate.mycoup.repo.CmGoosRepo;
import com.abanate.mycoup.repo.CmStorRepo;
import com.abanate.mycoup.repo.CmUsrRepo;
import com.abanate.mycoup.repo.CrUsrStorRepo;

// Transaction은 AOP로 처리 함

@Service
//@Transactional /** RuntimeException과 그 자식들인 언체크(Unchecked) 예외만 롤백한다. 만약 체크 예외가 발생해도 롤백하고 싶다면 rollbackFor로 Exception 지정 */
public class MycoupService {
	
	@Autowired
	CmUsrRepo cmUsrRepo;
	
	@Autowired
	CmStorRepo cmStorRepo;
	
	@Autowired
	CrUsrStorRepo crUsrStorRepo;
	
	@Autowired
	CmGoosRepo cmGoosRepo;
	
	@Autowired
	ChVisitRepo chVisitRepo;
	
	//private static final Logger log = CustomLogger.getLogger();
	
	public CmUsr joinUsr2( CmUsr cmUsr, CmStor cmStor, HttpSession sess, HttpServletRequest req ) {
		return new CmUsr();
		
	}
	
	/**
	 * Send mail for change password.
	 * @param usrId
	 * @param email
	 * @return
	 */
	public boolean sendMailForChngPwd( HttpSession sess, HttpServletRequest req, String usrId, String natiCd, String email ) {
		CmUsr cmUsr = cmUsrRepo.findByUsrIdAndNatiCd( usrId, natiCd );
		if( !ChkUtil.chkNull( cmUsr ) ) {
			return false;
		} else {
			if( cmUsr.getEmail().toLowerCase().equals( email.toLowerCase() ) ) {
				
				// Get a token.
				String token;
				try {
					token = SecureUtil.sha256( email + String.valueOf( new Date().getTime() ) );
				} catch (NoSuchAlgorithmException e) {
					return false;
				}
				
				// Set the token.
				cmUsr.setPasswdChngToken( token );
				cmUsr.setComSuffix( sess, req );
				cmUsrRepo.save( cmUsr );
				String content = "<br/>For change your password in " + ConstUtil.MY_COUP_EMAIL + ",<br/>Please click below link.<br/><br/><br/>"
								+"<a href='" + req.getScheme() + "://" + req.getServerName() + "/mycoup/changePwd.do?usrId=" + usrId + "&natiCd=" + natiCd + "&passwdChngToken=" + token + "'>Change password link</a>"
								+"<br/><br/><br/>Thank you.";
				
				SendMail sm = new SendMail();
				if( sm.sendMail( email, "[" + ConstUtil.MY_COUP_EMAIL + "] Change your password.", content ) ) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		}
	}
	
	/**
	 * Regist membership
	 * @param cmUsr
	 */
	public CmUsr joinUsr( CmUsr cmUsr, CmStor cmStor, HttpSession sess, HttpServletRequest req ) {
		/*
		// Start of validation : https://jamesdreaming.tistory.com/197 -■■■■■■■■■■■■■■■
		String regExpPhone = "(\\d{2}|\\d{3})[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$";
		String regExpEmail = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; 
		if( !cmUsr.getUsrId().matches( regExpPhone ) ) {
            throw new ComException( "ID는 전화번호 형식이어야 합니다" );
		} else if( "".equals( cmUsr.getPasswd() ) ) {
			throw new ComException( "비밀번호가 입력되지 않았습니다" );
		} else if( "".equals( cmUsr.getUsrNm() ) ) {
			throw new ComException( "성함이 입력되지 않았습니다" );
		} else if( !"".equals( cmUsr.getEmail() ) && !cmUsr.getEmail().matches( regExpEmail ) ) {
			throw new ComException( "이메일 주소 형식을 확인해 주세요" );
		}
		
		if( cmUsr.getUsrTp() == 'S' ) {	// 경영주인 경우
			if( "".equals( cmStor.getStorNm() ) ) {
				throw new ComException( "상호가 입력되지 않았습니다" );
			} else if( !"".equals( cmStor.getTelNo() ) && !cmStor.getTelNo().matches( regExpPhone ) ) {
	            throw new ComException( "연락처는 전화번호 형식이어야 합니다" );
			} else if( "".equals( cmStor.getSavTp() ) ) {
				throw new ComException( "적립구분이 입력되지 않았습니다" );
			} else if( !"C".equals( cmStor.getSavTp() ) && !"P".equals( cmStor.getSavTp() ) ) {
				throw new ComException( "적립구분의 값이 올바르지 않습니다" );
			}
		} 
		// End of validation - ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		*/
		CmUsr tCmUsr = cmUsrRepo.findByUsrIdAndNatiCd( cmUsr.getUsrId(), cmUsr.getNatiCd() );
		if( ChkUtil.chkNull( tCmUsr) ) {
			cmUsr.setCmUsrSeq( tCmUsr.getCmUsrSeq() );
			cmUsr.setJoinYn( "Y" );
		}
		try {
			cmUsr.setPasswd( SecureUtil.sha256( cmUsr.getPasswd() ) );
		} catch( NoSuchAlgorithmException e ) {
			throw new ComException( "정보 처리 시 오류가 발생하였습니다<br/>관리자에게 연락 부탁드립니다<br/>( 비밀번호 변환 오류 )" );
		}
		//cmUsr.setNatiCd( "KR" );
		cmUsr.setComSuffix(sess, req);
		
		cmUsrRepo.save( cmUsr );
		
		if( cmUsr.getUsrTp().equals( "S" ) ) {	// 경영주인 경우 점포관리 저장
			cmStor.setStorId( cmUsr.getUsrId() );
			cmStor.setComSuffix(sess, req);
			
			//if( true ) {
			//	throw new ComException( "트랜잭션 테스트" );
			//}
			
			cmStorRepo.save( cmStor );
		}
		
		return cmUsr;
	}
	
	/**
	 * Login
	 * @param true : Success login, false : Failure login
	 */
	public boolean login( CmUsr cmUsr, HttpSession sess, HttpServletRequest req ) {
		// 사용자 정보 검색
		
		try {
			cmUsr.setPasswd( SecureUtil.sha256( cmUsr.getPasswd() ) );
		} catch( NoSuchAlgorithmException e ) {
			throw new ComException( "정보 처리 시 오류가 발생하였습니다<br/>관리자에게 연락 부탁드립니다<br/>( 비밀번호 변환 오류 )" );
		}
		
		cmUsr = cmUsrRepo.findByUsrIdAndPasswdAndNatiCdAndJoinYn( cmUsr.getUsrId(), cmUsr.getPasswd(), cmUsr.getNatiCd(), "Y" );
		if( cmUsr == null || cmUsr.getCmUsrSeq() == null ) {
			return false;
		} else {
			CmStor cmStor = cmStorRepo.findByStorId( cmUsr.getUsrId() );
			sess.setAttribute( "cmUsr", cmUsr );
			if( cmStor != null && cmStor.getCmStorSeq() != null ) {
				sess.setAttribute( "cmStor", cmStor );
			}
		}
		
		sess.setAttribute( "natiCd", cmUsr.getNatiCd() );
		return true;
	}
	
	/**
	 * Save move number.
	 * 1. If user is not exist then create.
	 * 2. Insert ChVisit new and delete old.
	 * 3. Insert or Update CrUsrStor new and delete old.
	 * 4. Old user convert into not joined user.
	 */
	public boolean saveMoveNumber( HttpServletRequest req, HttpSession sess ) {
		CmUsr oldUsr = (CmUsr)sess.getAttribute( "cmUsr" );
		// Check validation of sender and receiver's ID.
		if( oldUsr.getUsrId().equals( req.getParameter( "usrId" ) ) ) {
			throw new ComException( "양도/양수자가 동일한 전화번호 입니다" );
		}
		
		// Check validation of sender's password.
		String passwd = "";
		try {
			passwd = SecureUtil.sha256( req.getParameter( "password" ) );
		} catch( NoSuchAlgorithmException e ) {
			throw new ComException( "정보 처리 시 오류가 발생하였습니다<br/>관리자에게 연락 부탁드립니다<br/>( 비밀번호 변환 오류 )" );
		}
		
		if( !oldUsr.getPasswd().equals( passwd ) ) {
			throw new ComException( "비밀번호를 확인해 주세요" );			
		}
		
		// 1. If receiver not exist then create user and cr_usr_stor entity who is not joined. 
		CmUsr newUsr = cmUsrRepo.findByUsrIdAndNatiCd( req.getParameter( "usrId" ), sess.getAttribute( "natiCd" ).toString() );		
		if( !ChkUtil.chkNull( newUsr ) ) {	// Create user.
			newUsr = new CmUsr();
			
			newUsr.setUsrId( req.getParameter( "usrId" ) );
			newUsr.setJoinYn( "N" );
			newUsr.setComSuffix(sess, req);
			
			newUsr = cmUsrRepo.save( newUsr );
		}
		
		// Find coupon and point.
		for( CrUsrStor oCrUsrStor : crUsrStorRepo.findByCmUsrAndAccumAmtGreaterThan( oldUsr, 0L ) ) {			
			CrUsrStor nCrUsrStor = crUsrStorRepo.findByCmUsrAndCmStor( newUsr, oCrUsrStor.getCmStor() );
			if( ChkUtil.chkNull( nCrUsrStor) ) {
				
				// 3-1. Update CrUsrStor new.
				nCrUsrStor.setSavAmt(   nCrUsrStor.getSavAmt()   + oCrUsrStor.getSavAmt()   );
				nCrUsrStor.setUseAmt(   nCrUsrStor.getUseAmt()   + oCrUsrStor.getUseAmt()   );
				nCrUsrStor.setAccumAmt( nCrUsrStor.getAccumAmt() + oCrUsrStor.getAccumAmt() );
			} else {
				// 3-2. Insert CrUsrStor new.
				nCrUsrStor = new CrUsrStor();
				nCrUsrStor.setCmUsr		( newUsr					);
				nCrUsrStor.setCmStor	( oCrUsrStor.getCmStor()	);
				nCrUsrStor.setSavAmt	( oCrUsrStor.getSavAmt()   	);
				nCrUsrStor.setUseAmt	( oCrUsrStor.getUseAmt()   	);
				nCrUsrStor.setAccumAmt	( oCrUsrStor.getAccumAmt()	);
			}
			nCrUsrStor.setRmks( "번호이동" );
			nCrUsrStor.setComSuffix (sess, req);
			crUsrStorRepo.save( nCrUsrStor );
			
			// 2-1. Insert ChVisit new
			ChVisit newChVisit = new ChVisit();
			newChVisit.setCmUsr		( newUsr 					);
			newChVisit.setCmStor	( oCrUsrStor.getCmStor()	);
			newChVisit.setUseTp		( "S" 						);
			newChVisit.setSavAmt	( oCrUsrStor.getSavAmt()	);
			newChVisit.setUseAmt	( oCrUsrStor.getUseAmt()	);
			newChVisit.setAccumAmt	( oCrUsrStor.getAccumAmt()	);
			newChVisit.setGoosNm	( "번호이동" 				);
			newChVisit.setRmks		( "번호이동" 				);
			newChVisit.setComSuffix (sess, req);
			chVisitRepo.save( newChVisit );
		}
		
		// 2-2. Delete old ChVisit.
		chVisitRepo.deleteByCmUsr( oldUsr );		
		
		// 3-3. Delete old CrUsrStor.
		crUsrStorRepo.deleteByCmUsr( oldUsr );
		
		// 4. Old user convert into not joined user.
		oldUsr.setJoinYn( "N" );
		oldUsr.setRmks( "번호이동 후 회원 해지" );
		oldUsr.setComSuffix( sess, req );
		cmUsrRepo.save( oldUsr );
		
		return true;
	}
		
	/**
	 * Get cmGoos objects by cmStor in session
	 */
	public List<CmGoos> findCmGoosByCmStorInSession( HttpServletRequest req, HttpSession sess ) {
		CmStor cmStor = (CmStor)sess.getAttribute( "cmStor" );

		/*
		cmStor = cmStorRepo.getOne( cmStor.getCmStorSeq() );
		cmStor.getCmGoos().get(0).getGoosNm();
		return cmStor.getCmGoos();
		*/
		
		// 프록시 초기화 하지 않으면 오류 발생 : org.hibernate.LazyInitializationException: could not initialize proxy [com.abanate.mycoup.domain.CmStor#64] - no Session
		// Use QueryDSL( Initialize forced, because cmGoos.cmStor defined "LAZY" in CmGoosRepoImpl )
		// return cmGoosRepo.search( cmStor.getCmStorSeq() );
		
		// EAGER인 경우 바로 가능
		return cmGoosRepo.findAllByCmStorOrderBySavAmtAsc( cmStor );
	}
	
	/**
	 * Save coupon( point ) configurations
	 */
	public boolean saveSetup( HttpServletRequest req, HttpSession sess, long[] cmGoosSeq, long[] savAmt, String[] goosNm, String[] rmks, long[] delArr ) {
		CmStor cmStor = (CmStor)sess.getAttribute( "cmStor" );
		
		// Save amount of limitations
		if( cmStor.getSavLimitAmt() != Long.parseLong( req.getParameter( "savLimitAmt" ) ) ) {
			cmStor.setSavLimitAmt( Long.parseLong( req.getParameter( "savLimitAmt" ) ) );
			
			cmStor.setComSuffix	( sess, req	);
			cmStorRepo.save( cmStor );
		}
		
		// Save or merge data
		for( int i = 0; i < ( cmGoosSeq == null ? 0 : cmGoosSeq.length ); i++ ) {
			CmGoos cmGoos;
			if( cmGoosSeq[ i ] == 0 ) {	// Added data
				cmGoos = new CmGoos();
				cmGoos.setCmStor( cmStor );				
			} else {					// Updated data
				Optional<CmGoos> oCmGoos;
				oCmGoos = cmGoosRepo.findById( cmGoosSeq[ i ] );
				cmGoos = oCmGoos.get();
			}
			cmGoos.setGoosNm	( goosNm[ i ] );
			cmGoos.setSavAmt	( savAmt[ i ] );
			cmGoos.setRmks		( rmks	[ i ] );
			cmGoos.setComSuffix	( sess, req	  );
			cmGoosRepo.save( cmGoos );
		}
		
		// Delete data
		for( int i = 0; i < (delArr == null ? 0 : delArr.length ); i++ ) {
			Optional<CmGoos> cmGoos = cmGoosRepo.findById( delArr[ i ] );
			cmGoosRepo.delete( cmGoos.get() );
		}
				
		return true;
	}
	
	/**
	 * Save save or use
	 */
	public boolean saveSaveUse( HttpServletRequest req, HttpSession sess, CrUsrStor crUsrStor, String usrId ) {
		CmUsr  cmUsr 	= cmUsrRepo.findByUsrIdAndNatiCd( usrId, sess.getAttribute( "natiCd" ).toString() );
		CmStor cmStor 	= (CmStor)sess.getAttribute( "cmStor" );
			   cmStor	= ( cmStorRepo.findById( cmStor.getCmStorSeq() ) ).get();
		
		// Check save limit
		if( req.getParameter( "useTp").equals( "save" ) && ( ChkUtil.toZeroByLong( crUsrStor.getAccumAmt() ) + ChkUtil.toZeroByLong( crUsrStor.getSavAmt() ) > cmStor.getSavLimitAmt() ) ) {
			throw new ComException( "적립 제한을 초과하기에 적립할 수 없습니다" );
		}
			   
		// Create user who is not joined.
		if( cmUsr == null ) {
			cmUsr = new CmUsr();
			cmUsr.setUsrId			( usrId 	);
			cmUsr.setNatiCd			( ( (CmUsr)sess.getAttribute( "cmUsr" ) ).getNatiCd() );
			cmUsr.setPasswd			( "*" 		);
			cmUsr.setUsrNm			( "미가입"	);
			cmUsr.setMarketAgreeYn	( "N" 		);
			cmUsr.setJoinYn			( "N" 		);
			cmUsr.setComSuffix		( sess, req	);
			cmUsr = cmUsrRepo.save	( cmUsr 	);
		}
			   
		// Set applied amount to total amount of cmStor
		cmStor.setSavAmt( ChkUtil.toZeroByLong( cmStor.getSavAmt() ) + crUsrStor.getSavAmt() );
		cmStor.setUseAmt( ChkUtil.toZeroByLong( cmStor.getUseAmt() ) + crUsrStor.getUseAmt() );
		cmStorRepo.save( cmStor );
		
		// Keep the amount at this temporary variable.
		CrUsrStor tCrUsrStor = new CrUsrStor();
		tCrUsrStor.setSavAmt( crUsrStor.getSavAmt() );
		tCrUsrStor.setUseAmt( crUsrStor.getUseAmt() );
		tCrUsrStor.setRmks	( crUsrStor.getRmks() 	);
		
		
		// Find recorded crUsrStor
		crUsrStor.setCmUsr		( cmUsr 	);
		crUsrStor.setCmStor		( cmStor 	);
		crUsrStor = crUsrStorRepo.findByCmUsrAndCmStor( cmUsr, cmStor );
		
		// Calculate the amount of crUsrStor entity.
		if( ChkUtil.chkNull( crUsrStor ) ) {
			crUsrStor.setSavAmt		( crUsrStor.getSavAmt() 	+ tCrUsrStor.getSavAmt() );
			crUsrStor.setUseAmt		( crUsrStor.getUseAmt() 	+ tCrUsrStor.getUseAmt() );
			crUsrStor.setAccumAmt	( crUsrStor.getAccumAmt() 	+ tCrUsrStor.getSavAmt() );
			crUsrStor.setAccumAmt	( crUsrStor.getAccumAmt() 	- tCrUsrStor.getUseAmt() );
			crUsrStor.setRmks		( tCrUsrStor.getRmks() );
			
			// Process save or merge.
			crUsrStor.setComSuffix	( sess, req	);		
			crUsrStorRepo.save		( crUsrStor );
			
			// Save visit history
			ChVisit chVisit = new ChVisit();
			chVisit.setCmUsr	( crUsrStor.getCmUsr() 										);
			chVisit.setCmStor	( crUsrStor.getCmStor() 									);
			chVisit.setVisitDtm ( DateUtil.getDateTimeStrNoMark()							);
			chVisit.setSavAmt	( tCrUsrStor.getSavAmt() 									);
			chVisit.setUseAmt	( tCrUsrStor.getUseAmt() 									);
			chVisit.setAccumAmt	( crUsrStor.getAccumAmt() 									);
			// Set this given goods name.
			if( req.getParameter( "useTp").equals( "use" ) ) {
				chVisit.setUseTp( "U" );
				CmGoos cmGoos = cmGoosRepo.findAllByCmStorAndSavAmt( crUsrStor.getCmStor(), tCrUsrStor.getUseAmt() );
				if( ChkUtil.chkNull( cmGoos ) ) {
					chVisit.setGoosNm( cmGoos.getGoosNm() );
				}
			} else {
				chVisit.setUseTp( "S" );				
			}
			chVisit.setRmks	( req.getParameter( "saveUseMemo" ) 							);
			chVisit.setComSuffix( sess, req													);	// Set common suffix values
			chVisitRepo.save	( chVisit 													);	// Save visit history
		} else {
			if( tCrUsrStor.getUseAmt() > 0 ) {
				throw new ComException( "적립 이력이 없으므로 사용할 수 없습니다." );				
			}
			// Process save or merge.
			tCrUsrStor.setCmUsr		( cmUsr 	);
			tCrUsrStor.setCmStor	( cmStor 	);
			tCrUsrStor.setAccumAmt	( tCrUsrStor.getSavAmt() );
			tCrUsrStor.setComSuffix	( sess, req	);					// Set common suffix values
			crUsrStorRepo.save		( tCrUsrStor );
			
			// Save visit history
			ChVisit chVisit = new ChVisit();
			chVisit.setCmUsr	( tCrUsrStor.getCmUsr() 									);
			chVisit.setCmStor	( tCrUsrStor.getCmStor() 									);
			chVisit.setVisitDtm ( DateUtil.getDateTimeStrNoMark()							);
			chVisit.setUseTp 	( req.getParameter( "useTp").equals( "use" ) ? "U" : "S"	);
			chVisit.setSavAmt	( tCrUsrStor.getSavAmt() 									);
			chVisit.setUseAmt	( tCrUsrStor.getUseAmt() 									);
			chVisit.setAccumAmt	( tCrUsrStor.getAccumAmt() 									);
			// Set this given goods name.
			if( req.getParameter( "useTp").equals( "use" ) ) {
				chVisit.setUseTp( "U" );
				CmGoos cmGoos = cmGoosRepo.findAllByCmStorAndSavAmt( crUsrStor.getCmStor(), tCrUsrStor.getUseAmt() );
				if( ChkUtil.chkNull( cmGoos ) ) {
					chVisit.setGoosNm( cmGoos.getGoosNm() );
				}
			} else {
				chVisit.setUseTp( "S" );				
			}
			chVisit.setRmks	( req.getParameter( "saveUseMemo" ) 							);
			chVisit.setComSuffix( sess, req													);	// Set common suffix values
			chVisitRepo.save	( chVisit 													);	// Save visit history
		}
		
		return true;
	}
	
	/**
	 * Save integration coupon.
	 */
	public boolean saveIntegrationCoupon( HttpServletRequest req, HttpSession sess ) {
		String natiCd = ( (CmUsr)sess.getAttribute( "cmUsr" ) ).getNatiCd();
		// Check validation of sender and receiver's ID.
		if( req.getParameter( "oldUsrId" ).equals( req.getParameter( "newUsrId" ) ) )  {
			throw new ComException( "양도/양수자가 동일한 전화번호 입니다" );
		}
		
		// Check validation of sender's password.
		String passwd = "";
		try {
			passwd = SecureUtil.sha256( req.getParameter( "passwd" ) );
		} catch( NoSuchAlgorithmException e ) {
			throw new ComException( "정보 처리 시 오류가 발생하였습니다<br/>관리자에게 연락 부탁드립니다<br/>( 비밀번호 변환 오류 )" );
		}
		
		CmUsr 		oldUsr 			= cmUsrRepo.findByUsrIdAndPasswdAndNatiCd( req.getParameter( "oldUsrId" ), passwd, natiCd );
		if( !ChkUtil.chkNull( oldUsr ) ) {
			throw new ComException( "비밀번호를 확인해 주세요" );			
		}
		
		// Define variables.
		Long 		moveAmt 		= Long.parseLong( req.getParameter( "addAccumAmt" ) );
		CmStor		cmStor 			= (CmStor)sess.getAttribute( "cmStor" );
		CrUsrStor 	oldCrUsrStor 	= crUsrStorRepo.findByCmUsrAndCmStor( oldUsr, cmStor );
		
		// Validation
		if( moveAmt > oldCrUsrStor.getAccumAmt() ) {
			throw new ComException( "양도자가 가진 적립금보다 더 많이 이동할 수 없습니다." );
		}		
		
		CmUsr 		newUsr			= cmUsrRepo.findByUsrIdAndNatiCd( req.getParameter( "newUsrId" ), sess.getAttribute( "natiCd" ).toString() );
		CrUsrStor 	newCrUsrStor 	= crUsrStorRepo.findByCmUsrAndCmStor( newUsr, cmStor );
		
		// If receiver not exist then create user and cr_usr_stor entity who is not joined. 
		if( !ChkUtil.chkNull( newUsr ) ) {	// Create user.
			newUsr = new CmUsr();
			
			newUsr.setUsrId( req.getParameter( "newUsrId" ) );
			newUsr.setNatiCd( natiCd );
			newUsr.setJoinYn( "N" );
			newUsr.setComSuffix(sess, req);
			
			newUsr = cmUsrRepo.save( newUsr );
		}
		if( !ChkUtil.chkNull( newCrUsrStor ) ) {	// Create cr_usr_stor.
			newCrUsrStor = new CrUsrStor();
			newCrUsrStor.setCmUsr	( newUsr	);
			newCrUsrStor.setCmStor	( cmStor 	);
			newCrUsrStor.setSavAmt	( 0L 		);
			newCrUsrStor.setUseAmt	( 0L 		);
			newCrUsrStor.setAccumAmt( 0L 		);
		}
		
		// Move user coupon information.
		// New user.
		newCrUsrStor	.setSavAmt	( newCrUsrStor.getSavAmt() 	 	+ moveAmt 	);
		newCrUsrStor	.setAccumAmt( newCrUsrStor.getAccumAmt() 	+ moveAmt 	);
		
		ChVisit newChVisit = new ChVisit();
		newChVisit.setCmUsr		( newUsr 						);
		newChVisit.setCmStor	( cmStor 						);
		newChVisit.setUseTp		( "S" 							);
		newChVisit.setSavAmt	( moveAmt 						);
		newChVisit.setAccumAmt	( newCrUsrStor.getAccumAmt()	);
		newChVisit.setGoosNm	( "양수" 						);		
		newChVisit.setRmks		( "양수" 						);
		
		// Old user.
		oldCrUsrStor	.setUseAmt	( oldCrUsrStor.getUseAmt() 		+ moveAmt 	);
		oldCrUsrStor	.setAccumAmt( oldCrUsrStor.getAccumAmt() 	- moveAmt 	);
		
		ChVisit oldChVisit = new ChVisit();
		oldChVisit.setCmUsr		( oldUsr 						);
		oldChVisit.setCmStor	( cmStor 						);
		oldChVisit.setUseTp		( "U" 							);
		oldChVisit.setUseAmt	( moveAmt 						);
		oldChVisit.setAccumAmt	( oldCrUsrStor.getAccumAmt()	);
		oldChVisit.setGoosNm	( "양도" 						);		
		oldChVisit.setRmks		( "양도" 						);		
		
		// Add suffix
		newUsr			.setComSuffix(sess, req);
		newCrUsrStor	.setComSuffix(sess, req);
		newChVisit		.setComSuffix(sess, req);
		oldUsr			.setComSuffix(sess, req);
		oldCrUsrStor	.setComSuffix(sess, req);
		oldChVisit		.setComSuffix(sess, req);
		// Save
		cmUsrRepo		.save( newUsr 		);
		crUsrStorRepo	.save( newCrUsrStor	);
		chVisitRepo		.save( newChVisit 	);
		cmUsrRepo		.save( oldUsr 		);
		crUsrStorRepo	.save( oldCrUsrStor );
		chVisitRepo		.save( oldChVisit 	);
		
		return true;
	}
	
	/**
	 * Find CmUsr
	 * @return CmUsr
	 */
	public CmUsr findCmUsr( String usrId, String natiCd ) {
		return cmUsrRepo.findByUsrIdAndNatiCd( usrId, natiCd );
	}
	
	/**
	 * Find CrUsrStor
	 * @return List<CrUsrStor>
	 */
	public CrUsrStor findCrUsrStor( CmUsr cmUsr, CmStor cmStor ) {
		return crUsrStorRepo.findByCmUsrAndCmStor( cmUsr, cmStor);
	}
	
	/**
	 * Find ChVisit
	 * @return List<ChVisit>
	 */
	public List<ChVisit> findChVisit( CmUsr cmUsr, CmStor cmStor ) {
		return chVisitRepo.findByCmUsrAndCmStorOrderByChVisitSeqDesc( cmUsr, cmStor);
	}
	
	public CmStor findCmStor( String storId ) {
		return cmStorRepo.findByStorId( storId );
	}
	   
}