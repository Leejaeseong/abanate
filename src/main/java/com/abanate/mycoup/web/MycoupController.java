package com.abanate.mycoup.web;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abanate.com.service.RecaptchaService;
import com.abanate.com.util.ChkUtil;
import com.abanate.com.util.ConstUtil;
import com.abanate.com.util.ControllerUtil;
import com.abanate.com.util.DateUtil;
import com.abanate.com.util.SecureUtil;
import com.abanate.com.web.ComException;
import com.abanate.com.web.PageRequestCustom;
import com.abanate.mycoup.domain.ChGmap;
import com.abanate.mycoup.domain.ChVisit;
import com.abanate.mycoup.domain.CmGoos;
import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.domain.CrUsrStor;
import com.abanate.mycoup.repo.ChGmapRepo;
import com.abanate.mycoup.repo.ChVisitRepo;
import com.abanate.mycoup.repo.CmGoosRepo;
import com.abanate.mycoup.repo.CmStorRepo;
import com.abanate.mycoup.repo.CmUsrRepo;
import com.abanate.mycoup.repo.CrUsrStorRepo;
import com.abanate.mycoup.service.MycoupPreLoadService;
import com.abanate.mycoup.service.MycoupService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "mycoup/")
public class MycoupController {
	
	@Autowired
	MycoupService mycoupService;
	
	@Autowired
	MycoupPreLoadService mycoupPreLoadService;
	
	@Autowired
	CmUsrRepo cmUsrRepo;
	
	@Autowired
	CmStorRepo cmStorRepo;
	
	@Autowired
	CmGoosRepo cmGoosRepo;
	
	@Autowired
	CrUsrStorRepo crUsrStorRepo;
	
	@Autowired
	ChVisitRepo chVisitRepo;
	
	@Autowired
	ChGmapRepo chGmapRepo;
	
	@Autowired
	RecaptchaService recaptchaService;
	
	@Value( "${setting_api_naver_map_id}" )
	public String SETTING_API_NAVER_MAP_ID;
	
	@Value( "${setting_api_recaptcha_site_key}" )
	public String SETTING_API_RECAPTCHA_SITE_KEY;
	
	//private static final Logger log = CustomLogger.getLogger();
	
	/**
	 * Join member load
	 * @return
	 */
	@RequestMapping(value = "joinMember.do", method = RequestMethod.GET)
	public String initJoinMember(	  Model model
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res
			) {
		
		model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
		
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/joinMember";
	}
	
	/**
	 * Join member save
	 * @param request
	 * @return
	 * @throws ComException 
	 */
	@RequestMapping(value = "joinMember.do", method = RequestMethod.POST)
	public String joinMember(	  Model model
								, HttpSession sess
								, HttpServletRequest  req
								, HttpServletResponse res
								, @Valid @ModelAttribute( "cmUsr" )  CmUsr   cmUsr
								, @Valid @ModelAttribute( "cmStor" ) CmStor  cmStor
//								, BindingResult result
								) {
		
//		if (result.hasErrors()) {
//            // 에러 출력
//            List<ObjectError> list = result.getAllErrors();
//            for (ObjectError e : list) {
//                //LOG.error(" ObjectError : " + e);
//            	
//            }
//
//            throw new ComException( "Aaaaa" );
//        }

		// Check recaptcha
		Map<String, Object> recaptchaRes = recaptchaService.token( req.getParameter( "recaptchaToken" ), MycoupPreLoadService.rechapchaSecretKey );
		if( ChkUtil.chkPassRecaptcha( recaptchaRes ) ) {
		
			mycoupService.joinUsr(cmUsr, cmStor, sess, req);
			
			model = ControllerUtil.setModel( model, sess, req );
			
			model.addAttribute( "isComplete", true );
		} else {
			model.addAttribute( "isError", true );			
			model.addAttribute( "errMsg" , mycoupPreLoadService.getMMsg( "contr_machineryloginnoacceptable", req) );	// 자동화된 로그인은 지원하지 않습니다
			
			model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
		}
		
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/joinMember";
	}
	
	/**
	 * Index
	 */
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(	  Model model
								, HttpSession sess
								, HttpServletRequest  req
								, HttpServletResponse res
								) {
		
//		CmUsr cmUsr = new CmUsr();
//		cmUsr.setUsrId( "01011111234" );
//		cmUsr.setUsrId( "01012345678" );
//		cmUsr.setPasswd( "123456" );
//		mycoupService.login(cmUsr, sess, req);
		
		String usrLang = ControllerUtil.getCookie( "usrLang", "/mycoup/", req);
		if( ChkUtil.chkNull( usrLang ) && usrLang.equals( "ko-KR" ) ) {
			ControllerUtil.setCookie( "/mycoup/", res, "usrLang", usrLang );
		} else {
			ControllerUtil.setCookie( "/mycoup/", res, "usrLang", "English" );
		}
		
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/index";
	}
	
	/**
	 * Login
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(	  Model model
								, HttpSession sess
								, HttpServletRequest  req
								, HttpServletResponse res
								, @Valid @ModelAttribute( "cmUsr" ) CmUsr cmUsr
								) {
		
		// Check recaptcha
		Map<String, Object> recaptchaRes = recaptchaService.token( req.getParameter( "recaptchaToken" ), MycoupPreLoadService.rechapchaSecretKey );
		if( ChkUtil.chkPassRecaptcha( recaptchaRes ) ) {
			boolean isPass = mycoupService.login(cmUsr, sess, req);
			
			if( isPass ) {
				// Handle with cache
				if( req.getParameter( "rememberId" ) != null && req.getParameter( "rememberId" ).equals( "Y") ) {
					ControllerUtil.setCookie( "/mycoup/", res, "usrId"	, cmUsr.getUsrId()  );
					ControllerUtil.setCookie( "/mycoup/", res, "natiCd"	, cmUsr.getNatiCd() );
				} else {
					ControllerUtil.removeCookie( "/mycoup/", "usrId", res );
				}
				
				String rPage = "redirect:/mycoup/mycoupList.do"; // Mpve to user page			
				if( sess.getAttribute( "cmStor") != null ) {	// Move to store master page
					return "redirect:/mycoup/saveUse.do";
				}
				
				model.addAttribute( "isComplete", true );
				model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
				model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
				
				return rPage;
			} else {
				model.addAttribute( "isError", true );
				model.addAttribute( "errMsg" , mycoupPreLoadService.getMMsg( "contr_wrongaccount", req) ); // 계정 정보가 올바르지 않습니다
				
				model = ControllerUtil.setModel( model, sess, req );
				model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );				
				model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
				model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
				model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
				
				return "mycoup/login";
			}
		} else {
			model.addAttribute( "isError", true );			
			model.addAttribute( "errMsg" , "자동화된 로그인은 지원하지 않습니다" );
			model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
			model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
			
			return "mycoup/login";
		}
		
	}
	
	/**
	 * changePwd > start 
	 */
	@RequestMapping(value = "changePwd.do", method = RequestMethod.GET)
	public String initChangePwd(	  Model model
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res
			) {
		
		CmUsr cmUsr = cmUsrRepo.findByUsrIdAndNatiCdAndPasswdChngToken( req.getParameter( "usrId" ), req.getParameter( "natiCd" ), req.getParameter( "passwdChngToken" ) );
		if( ChkUtil.chkNull( cmUsr ) ) {
			model.addAttribute( "usrId"				, cmUsr.getUsrId()						);
			model.addAttribute( "natiCd"			, cmUsr.getNatiCd()						);
			model.addAttribute( "result"			, "Success" 							);
			model.addAttribute( "passwdChngToken"	, req.getParameter( "passwdChngToken" )	);
			
			model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );			
			model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
		} else {
			model.addAttribute( "result"			, ConstUtil.NOT_EXIST_DATA 				);
		}
		
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/changePwd";
	}
	/**
	 * changePwd > save 
	 */
	@RequestMapping(value = "changePwd.do", method = RequestMethod.POST)
	public String saveChangePwd(	  Model model
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res
			) {
		
		// Check recaptcha
		Map<String, Object> recaptchaRes = recaptchaService.token( req.getParameter( "recaptchaToken" ), MycoupPreLoadService.rechapchaSecretKey );
		if( ChkUtil.chkPassRecaptcha( recaptchaRes ) ) {
			
			CmUsr cmUsr = cmUsrRepo.findByUsrIdAndNatiCdAndPasswdChngToken( req.getParameter( "usrId" ), req.getParameter( "natiCd" ), req.getParameter( "passwdChngToken" ) );
			if( ChkUtil.chkNull( cmUsr ) ) {
				try {
					cmUsr.setPasswd( SecureUtil.sha256( req.getParameter( "passwd" ) ) );
				} catch( NoSuchAlgorithmException e ) {
					model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
					model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
					throw new ComException( mycoupPreLoadService.getMMsg( "contr_errorinpasswdconvert", req) );	// 정보 처리 시 오류가 발생하였습니다<br/>관리자에게 연락 부탁드립니다<br/>( 비밀번호 변환 오류 )
				}
				cmUsr.setPasswdChngToken( "" );
				cmUsr.setComSuffix( sess, req );
				cmUsrRepo.save( cmUsr );
				model.addAttribute( "isComplete", true );
			} else {
				model.addAttribute( "isError", true );
				model.addAttribute( "errMsg" , mycoupPreLoadService.getMMsg( "contr_machinerynoacceptable", req) );	// 자동화된 접근(ex. Robot, 크롤링)은 허용되지 않습니다
			}
			
		} else {
			model.addAttribute( "isError", true );
			model.addAttribute( "errMsg" , mycoupPreLoadService.getMMsg( "contr_wrongaccesspath", req) );	// 접근 경로가 올바르지 않습니다
		}
		
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/changePwd";
	}
	
	/**
	 * Logout
	 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(	  Model model
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res
			) {
		
		sess.invalidate();
		
		return "redirect:/mycoup/index.do";
	}
	
	/**
	 * Check whether if user id is exist
	 * @param jsonString : {id:idcontent}
	 * @return 	"ok" is not duplicated
	 *  		"duplicated" is duplicated usr id
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/chkUsrId.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String chkUsr( @RequestBody String jsonString, HttpSession sess, HttpServletRequest req, HttpServletResponse res ) {
		
		Gson gson = new Gson();
		Map<String, String> map = new HashMap<String, String>();
		map = ( Map<String, String> )gson.fromJson( jsonString, map.getClass() );
		
		List<CmUsr> cmUsr = cmUsrRepo.findByUsrIdAndNatiCdOrEmailIgnoreCase( map.get( "usrId" ), map.get( "natiCd" ), map.get( "email" ) );
		boolean usrIdDup = false;
		boolean emailDup = false;
		for( int i = 0; i < cmUsr.size(); i++ ) {
			if( cmUsr.get( i ).getUsrId().equals( map.get( "usrId" ) ) ) {
				if( cmUsr.get( i ).getJoinYn().equals( "Y" ) ) {	// Join member's id duplication don't permit.
					usrIdDup = true;
				}
			}
			if( ChkUtil.chkNull( cmUsr.get( i ).getEmail() ) && cmUsr.get( i ).getEmail().equals( map.get( "email" ) ) ) {
				emailDup = true;
			}
		}
		
		if( usrIdDup ) {
			return "id duplicated";			
		} else if( emailDup ) {
			return "email duplicated";
		} else {
			return "ok";
		}
		
	}
	
	/**
	 * API Address
	 */
	@RequestMapping(value = "apiAddress.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String apiAddress(	  Model model
			, HttpSession sess
			, HttpServletResponse res
			, HttpServletRequest req ) {
		
		model.addAttribute( "SETTING_API_ADDRESS_KEY_PC"	, MycoupPreLoadService.koreaAddressKeyPc );
		model.addAttribute( "SETTING_API_ADDRESS_KEY_MOBILE", MycoupPreLoadService.koreaAddressKeyMobile );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		// 주소 연동 폐기, 승인키 갱신, 현재는 개발용으로 라이선스 유효기간 짧음
		
		return "com/apiAddress";
	}
	
	/**
	 * User > login > send email for password change.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/sendMailForChngPwd.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String sendMailForChngPwd( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		
		// Check recaptcha
		Map<String, Object> recaptchaRes = recaptchaService.token( map.get( "recaptchaToken" ).toString(), MycoupPreLoadService.rechapchaSecretKey );
		if( ChkUtil.chkPassRecaptcha( recaptchaRes ) ) {
			boolean sendOk = mycoupService.sendMailForChngPwd( sess, req, (String)map.get( "usrId" ), (String)map.get( "natiCd" ), (String)map.get( "email" ) );
			
			if( sendOk ) {
				return "SEND OK";
			} else {
				return ConstUtil.NOT_EXIST_DATA;
			}			
		} else {
			return ConstUtil.RECAPTCHA_FAIL;
		}
		
	}
	
	/**
	 * User > Mycoupon list start
	 */
	@RequestMapping(value = "mycoupList.do", method = RequestMethod.GET)
	public String initMycoupList(	  Model model
									, HttpSession sess
									, HttpServletRequest  req
									, HttpServletResponse res ) {
		
		// Check user login status.
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		
		CmUsr cmUsr = (CmUsr)sess.getAttribute( "cmUsr" );
		
		// Load the summary information of coupon.
		Map<String, Long> rMap = crUsrStorRepo.findMycoupListSummaryByCmUsr(cmUsr);
		model.addAttribute( "sumInfo", rMap );

		model = ControllerUtil.setModel( model, sess, req );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/mycoupList";
	}
	/**
	 * User > Mycoupon list > get store list.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findStore.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findStore( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check user login status.
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		int    	pageNo	= ChkUtil.toIntPaging( map.get( "pageNo" ) );
		String	sType	= (String)map.get( "sType" );
		Pageable pageable 	= PageRequestCustom.of(pageNo, ConstUtil.PAGE_SIZE);
		
		//List<Map<String,Object>> list = null;
		CmUsr 				cmUsr	= (CmUsr)sess.getAttribute( "cmUsr" );
		Map<String,Object>	rMap = cmStorRepo.findByTelNoContainingAndStorNmContainingAndNatiCd( cmUsr.getUsrId(), (String)map.get( "storId" ), (String)map.get( "storNm" ), cmUsr.getNatiCd(), (Boolean)map.get( "isVisited" ), sType, pageable );			
		
		if( rMap != null && ( (List<?>)rMap.get( "data" ) ).size() > 0 ) {
			return gson.toJson( rMap );
		} else {
			return ConstUtil.NOT_EXIST_DATA;
		}
	}
	/**
	 * User > Mycoupon list > get store information.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findStoreInfo.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findStoreInfo( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check user login status.
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Map<String,Object> rMap = new HashMap<String,Object>();
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );

		CmUsr cmUsr = (CmUsr)sess.getAttribute( "cmUsr" );		
		Pageable pageable = PageRequestCustom.of( ChkUtil.toIntPaging( map.get( "pageNo" ) ), ConstUtil.PAGE_SIZE );
		
		List<CmGoos>  cmGoosList  = cmGoosRepo.findAllByCmStorOrderBySavAmtAsc( new CmStor( ChkUtil.toLong( map.get( "cmStorSeq" ) ) ) );
		List<ChVisit> chVisitList = chVisitRepo.findByCmUsr_usrIdAndCmStor_cmStorSeqOrderByVisitDtmDescChVisitSeqDesc( cmUsr.getUsrId(), ChkUtil.toLong( map.get( "cmStorSeq" ) ), pageable );
	
		rMap.put( "cmGoos"	, cmGoosList	);
		rMap.put( "chVisit"	, chVisitList 	);
		
		return gson.toJson( rMap );
	}
	/**
	 * User > Mycoupon list > more visit history.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findMoreVisit.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findMoreVisit( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check user login status.
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		
		CmUsr cmUsr = (CmUsr)sess.getAttribute( "cmUsr" );
		
		Pageable pageable = PageRequestCustom.of( ChkUtil.toIntPaging( map.get( "pageNo" ) ), ConstUtil.PAGE_SIZE );		
		
		Page<ChVisit> 	page= chVisitRepo.findByCmUsrAndCmStorOrderByVisitDtmDescChVisitSeqDesc( cmUsr, new CmStor( ChkUtil.toLong( map.get( "cmStorSeq" ) ) ), pageable );
		
		if( page.getContent().size() == 0 ) {
			return ConstUtil.NOT_EXIST_DATA;
		}
		
		Map<String, Object> rMap = new HashMap<String, Object>();
		rMap.put( "chVisit"		, page.getContent() );
		return gson.toJson( rMap );
	}
	
	/**
	 * User > Around start
	 */
	@RequestMapping(value = "around.do", method = RequestMethod.GET)
	public String initAround(	  Model model
								, HttpSession sess
								, HttpServletRequest  req
								, HttpServletResponse res ) {
		
		// Check user login status.
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		
		//model.addAttribute( "naverKey"		, SETTING_API_NAVER_MAP_ID );
		//model.addAttribute( "naverSecret"	, MycoupPreLoadService.naverMapSecretKey );
		
		// Check possible to load.		
		model.addAttribute( "canLoadGoogleMap", true );
		ChGmap chGmap = chGmapRepo.findByMgrDt( DateUtil.getDateStrNoMark() );
		if( chGmap != null && chGmap.getLoadCnt() >= ConstUtil.GMAP_DAILY_LOAD_CNT ) {
			model.addAttribute( "canLoadGoogleMap", false );			
		}
		
		model.addAttribute( "googleMapKey"	, MycoupPreLoadService.googleMapKey );
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		
		model = ControllerUtil.setModel( model, sess, req );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/around";
	}
	
	/**
	 * User > around > increase googlemap load count.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/saveAroundGoogleMapLoadCntInc.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String saveGoogleMapCntInc( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {

		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		
		// Check recaptcha
		Map<String, Object> recaptchaRes = recaptchaService.token( map.get( "recaptchaToken" ).toString(), MycoupPreLoadService.rechapchaSecretKey );
		if( ChkUtil.chkPassRecaptcha( recaptchaRes ) ) {
			
			// Check user login status.
			if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
			
			String today = DateUtil.getDateStrNoMark();
			
			// Update google map load count.
			int result = chGmapRepo.saveLoadCntInc( today );
						
			if( result == 0 ) { // insert
				ChGmap chGmap = new ChGmap();
				chGmap.setMgrDt( today );
				chGmap.setLoadCnt( 1L );
				chGmap.setComSuffix( sess, req );
				chGmapRepo.save( chGmap );
			}
			
			return ConstUtil.RECAPTCHA_SUCCESS;
		} else {
			return ConstUtil.RECAPTCHA_FAIL;
		}
		
	}
	
	/**
	 * User > around > find store location list.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findStoreLocation.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findStoreLocation( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check user login status.
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		
		Double latFrom, latTo, lngFrom, lngTo;
		latFrom = (Double)map.get( "lat" ) - 0.015000;
		latTo	= (Double)map.get( "lat" ) + 0.015000;
		lngFrom = (Double)map.get( "lng" ) - 0.035000;
		lngTo	= (Double)map.get( "lng" ) + 0.035000;
		
		return gson.toJson( cmStorRepo.findByMapLatBetweenAndMapLngBetween( String.valueOf( latFrom ), String.valueOf( latTo ), String.valueOf( lngFrom ), String.valueOf( lngTo ) ) );
		//return gson.toJson( cmStorRepo.findAll() );
	}
	
	/**
	 * User > Move number start
	 */
	@RequestMapping(value = "moveNumber.do", method = RequestMethod.GET)
	public String initMoveNumber(  Model model
						, HttpSession sess
						, HttpServletRequest  req
						, HttpServletResponse res ) {
		
		// Check stor masters login status
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/moveNumber";
	}
	/**
	 * User > move number > find user
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findUserByUsrId.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findUserByUsrId( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check store master login status
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		String usrId 	= (String)map.get( "usrId" 	);

		CmUsr cmUsr = cmUsrRepo.findByUsrIdAndNatiCd( usrId, sess.getAttribute( "natiCd" ).toString() );
		
		if( ChkUtil.chkNull( cmUsr ) ) {
			return gson.toJson( cmUsr );
		} else {
			return ConstUtil.NOT_EXIST_DATA;
		}
	}
	/**
	 * User > move number > save
	 */
	@RequestMapping(value = "moveNumber.do", method = RequestMethod.POST)
	public String saveMoveNumber(  Model model
						, HttpSession sess
						, HttpServletRequest  req
						, HttpServletResponse res ) {
		
		// Check stor masters login status
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }

		mycoupService.saveMoveNumber( req, sess );
		
		model = ControllerUtil.setModel( model, sess, req );
		model.addAttribute( "isComplete", true );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/moveNumber";
	}
	
	/**
	 * Store > saveUse > start
	 */
	@RequestMapping(value = "saveUse.do", method = RequestMethod.GET)
	public String initSaveUse(  Model model
						, HttpSession sess
						, HttpServletRequest  req
						, HttpServletResponse res ) {
		
		// Check store masters login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		
		model = ControllerUtil.setModel( model, sess, req );
		
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/saveUse";
	}
	/**
	 * Stor > saveUse > get user information 
	*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findSaveUseInfo.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findSaveUseInfo( @RequestBody String jsonString
									, HttpSession sess
									, HttpServletRequest  req
									, HttpServletResponse res ) {
		
		// Check store master login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Gson gson = new Gson();
		Map<String, String> map = ( Map<String, String> )gson.fromJson( jsonString, new HashMap<String, String>().getClass() );
		
		CmUsr cmUsr = mycoupService.findCmUsr( map.get( "usrId" ), sess.getAttribute( "natiCd" ).toString() );
		
		if( cmUsr != null && !"".equals( cmUsr.getUsrId() ) ) {
			CmStor 			cmStor 			= (CmStor)sess.getAttribute( "cmStor" );
			CrUsrStor 		crUsrStorList 	= crUsrStorRepo	.findByCmUsrAndCmStor( cmUsr, cmStor );
			
			//List<ChVisit> 	chVisitList 	= chVisitRepo	.findByCmUsrAndCmStorOrderByChVisitSeqDesc( cmUsr, cmStor );
			// Stor > saveUse > get visit history.
			Pageable pageable 	= PageRequestCustom.of(ConstUtil.FIRST_PAGE, ConstUtil.PAGE_SIZE);
			Page<ChVisit> page 	= chVisitRepo.findByCmUsrAndCmStorOrderByVisitDtmDescChVisitSeqDesc( cmUsr, cmStor, pageable );
			
			Map<String, Object> rMap = new HashMap<String, Object>();
			rMap.put( "cmUsr"		, cmUsr 			);
			if( !page.isEmpty() ) {
				page.getContent().get(0).getCmUsr().getUsrNm();	// For entity initialization test.
				
				rMap.put( "chVisit"		, page.getContent() );				
				rMap.put( "crUsrStor"	, crUsrStorList 	);
				
			} 
			return gson.toJson( rMap );
		} else {
			return ConstUtil.NOT_EXIST_DATA;
		}
	}
	
	/**
	 * saveUse > get more visit history.
	 * 			3. visitHistory > get visit history.
	*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findVisitHistoryMore.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findVisitHistoryMore( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check store master login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		
		CmUsr cmUsr = mycoupService.findCmUsr( (String)map.get( "usrId" ), sess.getAttribute( "natiCd" ).toString() );
		
		if( cmUsr != null && !"".equals( cmUsr.getUsrId() ) ) {
			CmStor cmStor = (CmStor)sess.getAttribute( "cmStor" );
			
			Pageable pageable = PageRequestCustom.of( ChkUtil.toIntPaging( map.get( "pageNo" ) ), ConstUtil.PAGE_SIZE );
			
			Page<ChVisit> 	page= chVisitRepo.findByCmUsrAndCmStorOrderByVisitDtmDescChVisitSeqDesc( cmUsr, cmStor, pageable );
			
			if( page.getContent().size() == 0 ) {
				return ConstUtil.NOT_EXIST_DATA;
			}
			
			Map<String, Object> rMap = new HashMap<String, Object>();
			rMap.put( "chVisit"		, page.getContent() );
			return gson.toJson( rMap );
		} else {			
			return ConstUtil.NOT_EXIST_DATA;
		}
	}
	/**
	 * Store > saveUse > save
	 */
	@RequestMapping(value = "saveUse.do", method = RequestMethod.POST)
	public String saveSaveUse(  Model model
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res 
			, @Valid @ModelAttribute( "crUsrStor" ) CrUsrStor  crUsrStor
			) {
		
		// Check recaptcha
		Map<String, Object> recaptchaRes = recaptchaService.token( req.getParameter( "recaptchaToken" ), MycoupPreLoadService.rechapchaSecretKey );
		if( ChkUtil.chkPassRecaptcha( recaptchaRes ) ) {
		
			// Check store masters login status
			if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
			
			mycoupService.saveSaveUse( req, sess, crUsrStor, req.getParameter( "usrId" ) );
			
			model = ControllerUtil.setModel( model, sess, req );
			model.addAttribute( "isComplete", true );		
			
		} else {
			model.addAttribute( "isError", true );			
			model.addAttribute( "errMsg" , mycoupPreLoadService.getMMsg( "contr_machinerynoacceptable", req) );	// 자동화된 접근(ex. Robot, 크롤링)은 허용되지 않습니다
		}
		
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/saveUse";
	}
	
	/**
	 * Store > Visit history start
	 */
	@RequestMapping(value = "visitHistory.do", method = RequestMethod.GET)
	public String initVisitHistory(  Model model
						, HttpSession sess
						, HttpServletRequest  req
						, HttpServletResponse res ) {
		
		// Check stor masters login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		
		CmStor cmStor = (CmStor)sess.getAttribute( "cmStor" );
		cmStor = cmStorRepo.findByStorId( cmStor.getStorId() );
		
		model.addAttribute( "cmStor", cmStor );	
		
		// Count of accumulated customers.
		model.addAttribute( "accumCustomerCnt", crUsrStorRepo.countByCmStor( cmStor ) );
		
		model = ControllerUtil.setModel( model, sess, req );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		return "mycoup/visitHistory";
	}
	/**
	 * Store > visitHistory > get visit history.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findVisitHistory.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findVisitHistory( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check store master login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		String usrId 	= (String)map.get( "usrId" 	);
		String usrNm 	= (String)map.get( "usrNm" 	);
		String fDt 		= (String)map.get( "fDt" 	);
		String tDt 		= (String)map.get( "tDt" 	);
		int    pageNo	= ChkUtil.toIntPaging( map.get( "pageNo" ) );
		CmStor cmStor 	= (CmStor)sess.getAttribute( "cmStor" );
		String natiCd   = ( (CmUsr)sess.getAttribute( "cmUsr" ) ).getNatiCd();
				
		//List<ChVisit> chVisitList = null;
		//List<ChVisit> chVisitList = chVisitRepo.findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining(fDt, tDt, usrId, usrNm, pageNo);
		Pageable pageable 	= PageRequestCustom.of(pageNo, ConstUtil.PAGE_SIZE);
		List<ChVisit> chVisitList = chVisitRepo.findByCmStor_cmStorSeqAndVisitDtmBetweenAndCmUsr_usrIdContainingAndCmUsr_usrNmContainingAndCmUsr_natiCdOrderByChVisitSeqDesc(
											cmStor.getCmStorSeq()
										, 	ChkUtil.getMinDtm( fDt )
										, 	ChkUtil.getMaxDtm( tDt )
										, 	usrId
										, 	usrNm
										,   natiCd
										,  	pageable );		
		
		if( chVisitList != null && chVisitList.size() > 0 ) {
			Map<String, Object> rMap = new HashMap<String, Object>();
			rMap.put( "chVisitMeta", chVisitRepo.findByCmStor_cmStorSeqAndVisitDtmBetweenAndCmUsr_usrIdContainingAndCmUsr_usrNmContainingAndCmUsr_natiCdSummary( cmStor.getCmStorSeq(), fDt, tDt, usrId, usrNm, natiCd ) );
			rMap.put( "chVisit", chVisitList );
			return gson.toJson( rMap );
		} else {
			return ConstUtil.NOT_EXIST_DATA;
		}
	}
	
	/**
	 * Store > Setup start
	 */
	@RequestMapping(value = "setup.do", method = RequestMethod.GET)
	public String initSetup(  Model model
						, HttpSession sess
						, HttpServletRequest  req
						, HttpServletResponse res ) {
		
		// Check stor masters login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		
		List<CmGoos> cmGoosList = mycoupService.findCmGoosByCmStorInSession( req, sess );
		
		//org.hibernate.Hibernate.initialize( cmGoosList ); 	// Forced initialize	
		//cmGoosList.get( 0 ).getGoosNm();
		
		// Load goods management objects
		model.addAttribute( "cmGoos", cmGoosList );	
		
		model = ControllerUtil.setModel( model, sess, req );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/setup";
	}
	/**
	 * Store > Setup save
	 */
	@RequestMapping(value = "setup.do", method = RequestMethod.POST)
	public String saveSetup(  Model model
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res 
			, long[]   cmGoosSeq
			, long[]   savAmt
			, String[] goosNm
			, String[] rmks
			, long[] delArr ) {
		
		// Check stor masters login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		
		mycoupService.saveSetup( req, sess, cmGoosSeq, savAmt, goosNm, rmks, delArr );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "redirect:/mycoup/setup.do";
	}
	
	/**
	 * Store > Integrate start
	 */
	@RequestMapping(value = "integrationCoupon.do", method = RequestMethod.GET)
	public String initIntegrationCoupon(  Model model
						, HttpSession sess
						, HttpServletRequest  req
						, HttpServletResponse res ) {
		
		// Check stor masters login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/integrationCoupon";
	}
	/**
	 * Store > Integrate > find user and accumulation information.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/findUserAndAccumInfo.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String findUserAndAccumInfo( @RequestBody String jsonString
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check store master login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_JSON; }
		
		Gson gson = new Gson();
		Map<String, Object> map = ( Map<String, Object> )gson.fromJson( jsonString, new HashMap<String, Object>().getClass() );
		String usrId 	= (String)map.get( "usrId" 	);
		CmStor cmStor 	= (CmStor)sess.getAttribute( "cmStor" );
				
		Map<String,Object> rMap = new HashMap<String, Object>();
		CrUsrStor crUsrStor = crUsrStorRepo.findByCmUsr_usrIdAndCmStor( usrId, cmStor );
		if( ChkUtil.chkNull( crUsrStor ) ) {
			rMap.put( "usrNm"	, crUsrStor.getCmUsr().getUsrNm() 	);
			rMap.put( "accumAmt", crUsrStor.getAccumAmt() 			);
			return gson.toJson( rMap );
		} else { 
			boolean existData = false;
			// If none of data and search type is new then research from user information.
			if( map.get( "searchType" ).equals( "new" ) ) {
				CmUsr cmUsr = cmUsrRepo.findByUsrIdAndNatiCd( usrId, sess.getAttribute( "natiCd" ).toString() );
				if( ChkUtil.chkNull( cmUsr ) && ChkUtil.chkNull( cmUsr.getUsrId() ) ) {
					rMap = new HashMap<String, Object>();
					rMap.put( "usrNm"	, cmUsr.getUsrNm() 	);
					rMap.put( "accumAmt", 0L 				);
					existData = true;
				} 
			}
			if( existData ) {
				return gson.toJson( rMap );
			} else {
				return ConstUtil.NOT_EXIST_DATA;
			}
		}
		
		/* Not used because getting accum point is directly possible at the CR_USR_STOR
		Map<String,Object> rMap = chVisitRepo.findByCmStor_cmStorSeqAndCmUsr_usrIdSummary(
											cmStor.getCmStorSeq()
										,	usrId );
										
		if( ChkUtil.chkNull( rMap.get( "usrNm" ) ) ) {
			return gson.toJson( rMap );
		} else {
			boolean existData = false;
			// If none of data and search type is new then research from user information.
			if( map.get( "searchType" ).equals( "new" ) ) {
				CmUsr cmUsr = cmUsrRepo.findByUsrId( usrId );
				if( ChkUtil.chkNull( cmUsr ) && ChkUtil.chkNull( cmUsr.getUsrId() ) ) {
					rMap = new HashMap<String, Object>();
					rMap.put( "usrNm", cmUsr.getUsrNm() );
					rMap.put( "accumAmt", 0L );
					existData = true;
				} 
			}
			if( existData ) {
				return gson.toJson( rMap );
			} else {
				return ConstUtil.NOT_EXIST_DATA;
			}
		}
		*/
	}
	
	/**
	 * Store > Integrate > save
	 */
	@RequestMapping(value = "integrationCoupon.do", method = RequestMethod.POST)
	public String saveIntegrationCoupon(  Model model
						, HttpSession sess
						, HttpServletRequest  req
						, HttpServletResponse res ) {
		
		// Check stor masters login status
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }

		mycoupService.saveIntegrationCoupon( req, sess );
		
		model = ControllerUtil.setModel( model, sess, req );
		model.addAttribute( "isComplete", true );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/integrationCoupon";
	}
	
	/**
	 * User > Modify user information > init
	 */
	@RequestMapping(value = "modUsrInfo.do", method = RequestMethod.GET)
	public String modUsrInfoInit(	  Model model
									, HttpSession sess
									, HttpServletRequest  req
									, HttpServletResponse res ) {
		
		// Check user login status.
		if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		
		model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
		
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		
		model = ControllerUtil.setModel( model, sess, req );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/modUsrInfo";
	}
	
	/**
	 * User > Modify user information > save
	 * @param request
	 * @return
	 * @throws ComException 
	 */
	@RequestMapping(value = "modUsrInfo.do", method = RequestMethod.POST)
	public String modUsrInfoSave(	  Model model
									, HttpSession sess
									, HttpServletRequest  req
									, HttpServletResponse res
									, @Valid @ModelAttribute( "cmUsr" )  CmUsr   cmUsr
								) {

		// Check recaptcha
		Map<String, Object> recaptchaRes = recaptchaService.token( req.getParameter( "recaptchaToken" ), MycoupPreLoadService.rechapchaSecretKey );
		if( ChkUtil.chkPassRecaptcha( recaptchaRes ) ) {
		
			// Check user login status.
			if( !ControllerUtil.isUsrLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
			
			// Check passwordk
			try {
				if( cmUsrRepo.findByUsrIdAndPasswdAndNatiCd( cmUsr.getUsrId(), SecureUtil.sha256( cmUsr.getPasswd() ), cmUsr.getNatiCd() ) == null ) {
					model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
					model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
					throw new ComException( mycoupPreLoadService.getMMsg( "contr_wrongaccount", req) );	// 계정 정보가 올바르지 않습니다					
				}
			} catch( NoSuchAlgorithmException e ) {
				model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
				model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
				throw new ComException( mycoupPreLoadService.getMMsg( "contr_errorinpasswdconvert", req) );	// 정보 처리 시 오류가 발생하였습니다<br/>관리자에게 연락 부탁드립니다<br/>( 비밀번호 변환 오류 )
			}
			
			// Record modified user informations.
			CmUsr oCmUsr = (CmUsr)sess.getAttribute( "cmUsr" );
			
			oCmUsr.setUsrNm( cmUsr.getUsrNm() );
			oCmUsr.setEmail( cmUsr.getEmail() );
			oCmUsr.setMarketAgreeYn( cmUsr.getMarketAgreeYn() );
			
			if( req.getParameter( "chngPasswd" ) != null && !"".equals( (String)req.getParameter( "chngPasswd" ) ) ) {
				try {
					oCmUsr.setPasswd( SecureUtil.sha256( req.getParameter( "chngPasswd" ) ) );
				} catch( NoSuchAlgorithmException e ) {
					model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
					model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
					throw new ComException( mycoupPreLoadService.getMMsg( "contr_errorinpasswdconvert", req) );	// 정보 처리 시 오류가 발생하였습니다<br/>관리자에게 연락 부탁드립니다<br/>( 비밀번호 변환 오류 )
				}
			}
			
			oCmUsr.setComSuffix( sess, req );
			cmUsrRepo.save( oCmUsr );
			
			sess.setAttribute( "cmUsr", oCmUsr );
			
			model = ControllerUtil.setModel( model, sess, req );
			
			model.addAttribute( "isComplete", true );
		} else {
			model.addAttribute( "isError", true );			
			model.addAttribute( "errMsg" , mycoupPreLoadService.getMMsg( "contr_machinerynoacceptable", req) );	// 자동화된 접근(ex. Robot, 크롤링)은 허용되지 않습니다
			
			model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
		}
		
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		return "mycoup/modUsrInfo";
	}
	
	/**
	 * Store > Modify store information > init
	 */
	@RequestMapping(value = "modstorInfo.do", method = RequestMethod.GET)
	public String modStorInfoInit(	  Model model
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res ) {
		
		// Check store owner login status.
		if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
		
		model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
		
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		
		model = ControllerUtil.setModel( model, sess, req );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/modStorInfo";
	}
	
	/**
	 * Store > Modify store information > save
	 * @param request
	 * @return
	 * @throws ComException 
	 */
	@RequestMapping(value = "modStorInfo.do", method = RequestMethod.POST)
	public String modStorInfoSave(	  Model model
			, HttpSession sess
			, HttpServletRequest  req
			, HttpServletResponse res
			, @Valid @ModelAttribute( "cmUsr" )  CmUsr  cmUsr
			, @Valid @ModelAttribute( "cmStor" ) CmStor	cmStor
			) {
		
		// Check recaptcha
		Map<String, Object> recaptchaRes = recaptchaService.token( req.getParameter( "recaptchaToken" ), MycoupPreLoadService.rechapchaSecretKey );
		if( ChkUtil.chkPassRecaptcha( recaptchaRes ) ) {
			
			// Check user login status.
			if( !ControllerUtil.isStorLogin( sess ) ) { return ConstUtil.AUTH_FAIL_PAGE; }
			
			mycoupService.modUsrAndStor(cmUsr, cmStor, sess, req);
			
			model = ControllerUtil.setModel( model, sess, req );
			
			model.addAttribute( "isComplete", true );
		} else {
			model.addAttribute( "isError", true );			
			model.addAttribute( "errMsg" , mycoupPreLoadService.getMMsg( "contr_machinerynoacceptable", req) );	// 자동화된 접근(ex. Robot, 크롤링)은 허용되지 않습니다
			
			model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
		}
		
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/modUsrInfo";
	}
	
	/**
	 * Refresh multi language set.
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "refMultiLanguage.do", method = RequestMethod.GET)
	public String refMultiLanguage( Model model
							, HttpSession sess
							, HttpServletResponse res
							, HttpServletRequest req ) {
		
		mycoupPreLoadService.initMLang();
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/index";
	}
	
	/**
	 * Common Get init
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "{urlName}.do", method = RequestMethod.GET)
	public String initComGet( Model model
							, @PathVariable String urlName
							, HttpSession sess
							, HttpServletResponse res
							, HttpServletRequest req ) {
		
		model = ControllerUtil.setModel( model, sess, req );
		//model.addAttribute( "naverKey"						, SETTING_API_NAVER_MAP_ID );
		//model.addAttribute( "naverSecret"					, SETTING_API_NAVER_MAP_SECRET );
		model.addAttribute( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
		
		model.addAttribute( "cmNatiCd" ,  mycoupPreLoadService.getCmNatiCdList() );
		model.addAttribute( "usrLang" ,  ControllerUtil.getCookie( "usrLang", "/mycoup/", req) );
		model.addAttribute( "mLang" ,  mycoupPreLoadService.getMLang( req, res ) );
		
		return "mycoup/" + urlName;
	}
	
	/**
	 * test
	 */
	@CrossOrigin("*")
	@RequestMapping(value="/test.json",headers="Accept=*/*",produces="application/json;charset=UTF-8", method={RequestMethod.POST})
	@ResponseBody
	public String test( @RequestBody String jsonString, HttpSession sess, HttpServletRequest req, HttpServletResponse res ) {
		
//		res.setHeader("Access-Control-Allow-Origin", "*");	// CORS( Cross Origin Resource Share 정책, Real 도메인 )
//	    res.setHeader("Access-Control-Allow-Credentials", "*");
//	    res.setHeader("Access-Control-Allow-Methods", "*");
//	    res.setHeader("Access-Control-Max-Age", "3600");
//	    res.setHeader("Access-Control-Allow-Headers", "*");
//	    
		return "ok";
		
	}
}