package com.abanate.kokomath.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.abanate.com.util.ChkUtil;
import com.abanate.com.util.SecureUtil;
import com.abanate.kokomath.domain.KokoMemberMgr;
import com.abanate.kokomath.service.KokoMathMainService;

@Controller
@RequestMapping(value = "kokomath/")
public class KokoMathMainController {
	
	@Autowired
	KokoMathMainService kokoMathMainService;
	
	/**
	 * Main, Introduction
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String initMain(   Model model
							, HttpSession session
							, HttpServletRequest request ) {
		
		if( !ChkUtil.chkNull( session.getAttribute( "kokoMemberMgr" ) ) ) {
			model.addAttribute( "isLogin", null );
		} else {
			model.addAttribute( "isLogin", "true" );
		}
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put( "userIp", request.getRemoteAddr() );
		hashMap.put( "visitPage", "MAIN" );
		
		kokoMathMainService.saveVisitLogJpa(hashMap);
		
		return "kokomath/Main";
	}
	
	/**
	 * Login
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(	  Model model
							, HttpSession session
							, HttpServletRequest request ) {
		
		try {
			KokoMemberMgr kokoMemberMgr = kokoMathMainService.getMemberMgrLogin( (String)request.getParameter( "inputId" 	)
								, SecureUtil.sha256( (String)request.getParameter( "inputPw" ) ) );
			if( ChkUtil.chkNull( kokoMemberMgr ) && ChkUtil.chkNull( kokoMemberMgr.getUsrId() ) ) {
				session.setAttribute( "kokoMemberMgr", kokoMemberMgr );				
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return "forward:mathTop.do";
	}
	
	/**
	 * Logout
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "logout.do")
	public String logout(	  Model model
			, HttpSession session
			, HttpServletRequest request ) {
		
		session.invalidate();
		
		return "kokomath/Main";
	}
	
	/**
	 * Deep - MathTop
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "mathTop.do")
	public String initMathTop(   Model model
							, HttpSession session
							, HttpServletRequest request ) {
		
		String returnUrl = "kokomath/MathTop";
		
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put( "userIp", request.getRemoteAddr() );
		hashMap.put( "visitPage", "MathTop" );
		
		if( !ChkUtil.chkNull( session.getAttribute( "kokoMemberMgr" ) ) ) {	// 미 로그인 상태
			model.addAttribute( "isLogin", "false" );
			returnUrl = "kokomath/Main";
		} else {
			model.addAttribute( "isLogin", "true" );
			KokoMemberMgr kokoMemberMgr = (KokoMemberMgr)session.getAttribute( "kokoMemberMgr" );
			
			hashMap.put( "userId"	, kokoMemberMgr.getUsrId() );
			hashMap.put( "visitPage", "MathTop" );
		}		
		
		kokoMathMainService.saveVisitLogJpa(hashMap);
		
		return returnUrl;
	}
	
	/**
	 * Deep - MathBottom
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "mathBottom.do")
	public String initMathBottom(   Model model
			, HttpSession session
			, HttpServletRequest request ) {
		
		String returnUrl = "kokomath/MathBottom";
		
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put( "userIp", request.getRemoteAddr() );
		hashMap.put( "visitPage", "MathBottom" );
		
		if( !ChkUtil.chkNull( session.getAttribute( "kokoMemberMgr" ) ) ) {	// 미 로그인 상태
			model.addAttribute( "isLogin", "false" );
			returnUrl = "kokomath/Main";
		} else {
			model.addAttribute( "isLogin", "true" );
			KokoMemberMgr kokoMemberMgr = (KokoMemberMgr)session.getAttribute( "kokoMemberMgr" );
			
			hashMap.put( "userId"	, kokoMemberMgr.getUsrId() );
			hashMap.put( "visitPage", "MathBottom" );
		}		
		
		kokoMathMainService.saveVisitLogJpa(hashMap);
		
		return returnUrl;
	}
	
	/**
	 * Deep - MathOne
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "mathOne.do")
	public String initMathOne(   Model model
			, HttpSession session
			, HttpServletRequest request ) {
		
		String returnUrl = "kokomath/MathOne";
		
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put( "userIp", request.getRemoteAddr() );
		hashMap.put( "visitPage", "MathOne" );
		
		if( !ChkUtil.chkNull( session.getAttribute( "kokoMemberMgr" ) ) ) {	// 미 로그인 상태
			model.addAttribute( "isLogin", "false" );
			returnUrl = "kokomath/Main";
		} else {
			model.addAttribute( "isLogin", "true" );
			KokoMemberMgr kokoMemberMgr = (KokoMemberMgr)session.getAttribute( "kokoMemberMgr" );
			
			hashMap.put( "userId"	, kokoMemberMgr.getUsrId() );
			hashMap.put( "visitPage", "MathOne" );
		}		
		
		kokoMathMainService.saveVisitLogJpa(hashMap);
		
		return returnUrl;
	}
	
	/**
	 * Deep - MathTwo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "mathTwo.do")
	public String initMathTwo(   Model model
			, HttpSession session
			, HttpServletRequest request ) {
		
		String returnUrl = "kokomath/MathTwo";
		
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put( "userIp", request.getRemoteAddr() );
		hashMap.put( "visitPage", "MathTwo" );
		
		if( !ChkUtil.chkNull( session.getAttribute( "kokoMemberMgr" ) ) ) {	// 미 로그인 상태
			model.addAttribute( "isLogin", "false" );
			returnUrl = "kokomath/Main";
		} else {
			model.addAttribute( "isLogin", "true" );
			KokoMemberMgr kokoMemberMgr = (KokoMemberMgr)session.getAttribute( "kokoMemberMgr" );
			
			hashMap.put( "userId"	, kokoMemberMgr.getUsrId() );
			hashMap.put( "visitPage", "MathTwo" );
		}		
		
		kokoMathMainService.saveVisitLogJpa(hashMap);
		
		return returnUrl;
	}
	
	/**
	 * Regist init
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "registInit.do", method = RequestMethod.GET)
	public String registInit( Model model
							, HttpSession session
							, HttpServletRequest request ) {
		
		// History record
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put( "userIp", request.getRemoteAddr() );
		hashMap.put( "visitPage", "MAIN" );		
		kokoMathMainService.saveVisitLogJpa(hashMap);
		
		return "kokomath/Regist";
	}
	/**
	 * Regist do
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "registDo.do", method = RequestMethod.POST)
	public String registDo(	  Model model
							, HttpSession session
							, HttpServletRequest request ) {
		
		// check id
		if( kokoMathMainService.getMemberMgr( (String)request.getParameter( "inputId" ) ) != null ) {
			model.addAttribute( "processResult", "dupleId" );
		} else {
			HashMap<String,Object> hashMap = new HashMap<String, Object>();
			
			try {
				KokoMemberMgr kokoMemberMgr = new KokoMemberMgr();
				kokoMemberMgr.setUsrId		( (String)request.getParameter( "inputId" 	)						);
				kokoMemberMgr.setUsrNm		( (String)request.getParameter( "inputName" 	)					);
				kokoMemberMgr.setPasswd		( SecureUtil.sha256( (String)request.getParameter( "inputPw" ) )	);
				kokoMemberMgr.setEmailAddr	( (String)request.getParameter( "inputEmail"	)					);
				kokoMemberMgr.setGrade		( (String)request.getParameter( "inputGrade" )						);
				kokoMemberMgr.setAddr		( (String)request.getParameter( "inputAddr" 	)					);
				kokoMemberMgr.setMsg		( (String)request.getParameter( "inputMsg" 	)						);
				kokoMemberMgr.setRegUsrIp	( request.getRemoteAddr() 											);
				kokoMemberMgr.setUpdUsrIp	( request.getRemoteAddr() 											);
				
				kokoMathMainService.saveRegister(kokoMemberMgr);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			
			model.addAttribute( "processResult", "success" );
			
		}
		
		return "kokomath/Regist";
	}
	
	/**
	 * Member leave
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "memberLeave.do")
	public String memberLeave(	  Model model
							, HttpSession session
							, HttpServletRequest request ) {
		
		// History record
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put( "userIp", request.getRemoteAddr() );
		hashMap.put( "visitPage", "Leave(" + 
				( (KokoMemberMgr)session.getAttribute( "kokoMemberMgr" ) ).getUsrId()
				+ ")" );
		kokoMathMainService.saveVisitLogJpa(hashMap);
				
		KokoMemberMgr kokoMemberMgr = (KokoMemberMgr)session.getAttribute( "kokoMemberMgr" );
		kokoMathMainService.leaveMember( kokoMemberMgr );

		session.invalidate();
		
		model.addAttribute( "isLogin", "leave" );
		
		return "kokomath/Main";
		
	}
	
	/**
	 * Under construction
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "underConstruction.do", method = RequestMethod.GET)
	public String initUnderConstruction( HttpServletRequest request ) {
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put( "userIp", request.getRemoteAddr() );
		hashMap.put( "visitPage", "CONSTRUCTION" );
		 
		kokoMathMainService.saveVisitLogJpa(hashMap);
		 
		return "kokomath/UnderConstruction";
	 }

}