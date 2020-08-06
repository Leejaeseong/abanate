package com.abanate.mycoup.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.abanate.com.util.ConstUtil;
import com.abanate.com.util.CustomLogger;
import com.abanate.com.web.PageRequestCustom;
import com.abanate.mycoup.domain.ChVisit;
import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.domain.CrUsrStor;
import com.abanate.mycoup.repo.ChVisitRepo;
import com.abanate.mycoup.repo.CmStorRepo;
import com.abanate.mycoup.repo.CmUsrRepo;
import com.abanate.mycoup.repo.CrUsrStorRepo;
import com.abanate.mycoup.repo.NqueryRepo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/context-*.xml")
@Transactional
public class MycoupServiceTest {

	@Autowired MycoupService	mycoupService;
	@Autowired CmUsrRepo 		cmUsrRepo;
	@Autowired CmStorRepo 		cmStorRepo;
	@Autowired ChVisitRepo 		chVisitRepo;
	@Autowired CrUsrStorRepo 	crUsrStorRepo;
	@Autowired NqueryRepo	 	nqueryRepo;
	
	private static final Logger log = CustomLogger.getLogger();
	
//	@Test
	public void testJoinUsr() throws Exception {
		
		// Given ------------------------------------------------------------------------------------------
		CmUsr cmUsr = new CmUsr();
		cmUsr.setUsrId( "aaabbbcccc" );
		cmUsr.setUsrNm( "테스트1" );
		cmUsr.setPasswd( "aaa" );
		cmUsr.setNatiCd( "KOR" );
		cmUsr.setUsrTp( "S" );
		cmUsr.setMarketAgreeYn( "Y" );
		
		CmStor cmStor = new CmStor();
		HttpServletRequest mocReq = Mockito.mock(HttpServletRequest.class);
		MockHttpSession mocSess = new MockHttpSession();
		
		// When ------------------------------------------------------------------------------------------
		cmUsr = mycoupService.joinUsr( cmUsr, cmStor, mocSess, mocReq );
		
		// Then ------------------------------------------------------------------------------------------
		Assert.assertTrue( cmUsr.getUsrId() != null);		
	}
	
//	@Test
	public void testJoinStor() throws Exception {
		
		// Given ------------------------------------------------------------------------------------------
		CmUsr cmUsr = new CmUsr();
		cmUsr.setUsrId( "aaabbbcccc" );
		cmUsr.setUsrNm( "테스트1" );
		cmUsr.setPasswd( "aaa" );
		cmUsr.setNatiCd( "KOR" );
		cmUsr.setUsrTp( "S" );
		cmUsr.setMarketAgreeYn( "Y" );
		
		CmStor cmStor = new CmStor();
		cmStor.setStorId( "aaabbbcccc" );
		cmStor.setStorNm( "테스트1" );
		cmStor.setTelNo( "2123456789a" );
		cmStor.setSavTp( "A");
		
		HttpServletRequest mocReq = Mockito.mock(HttpServletRequest.class);
		MockHttpSession mocSess = new MockHttpSession();
		
		// When ------------------------------------------------------------------------------------------
		cmUsr = mycoupService.joinUsr( cmUsr, cmStor, mocSess, mocReq );
		
		// Then ------------------------------------------------------------------------------------------
		Assert.assertTrue( cmUsr.getUsrId() != null);		
	}
	
//	@Test
	public void testUsrFind() throws Exception {
	
		// Given ------------------------------------------------------------------------------------------
		String usrId = "TEST1";
		
		// When ------------------------------------------------------------------------------------------
		CmUsr cmUsr = mycoupService.findCmUsr( usrId, "KOR" );
		
		// Then ------------------------------------------------------------------------------------------
		Assert.assertEquals( usrId, cmUsr.getUsrId() );
		
	}
	
//	@Test
	public void testStorFind() throws Exception {
		
		// Given ------------------------------------------------------------------------------------------
		String storId = "TEST1";
		
		// When ------------------------------------------------------------------------------------------
		CmStor cmStor = mycoupService.findCmStor( storId );
		
		// Then ------------------------------------------------------------------------------------------
		Assert.assertEquals( storId, cmStor.getStorId() );
		
	}
	
//	@Test
	public void testJoin1() throws Exception {
		
		// Given ------------------------------------------------------------------------------------------
		//String storId = "U";
		
		// When ------------------------------------------------------------------------------------------
		//List<ChVisit> chVisitList = chVisitRepo.findAll( ChVisitSpecs.usrNmLike() );
		//List<ChVisit> chVisitList = chVisitRepo.findAll( new ChVisit().toSpecification() );
		//List<ChVisit> chVisitList = chVisitRepo.findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining( null, null, "01012345678", null );
		//List<ChVisit> chVisitList = chVisitRepo.findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining( null, null, null, "이재성", 1 );
		//List<ChVisit> chVisitList = chVisitRepo.findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining( "20200201", "20200225", "01012345678", "이재성", 1 );
		//Map<String, Long> chVisitList = chVisitRepo.findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContainingSummary( "20200201", "20200225", "01012345678", "이재성", 1 );
		
		//List<ChVisit> chVisitList = chVisitRepo.findAll();
		
		//List<Map<String,Object>> chVisitList = nqueryRepo.findNativeQueryTest();
		//List<Map<String,Object>> chVisitList = chVisitRepo.findNativeQueryTest();
		
		// Then ------------------------------------------------------------------------------------------
		
		//Assert.assertTrue( (chVisitList).get( 0 ).getCmUsr().getUsrNm().equals( "이재성" ) );

		//log.info( "aaaaaa = " + chVisitList.toString() );
		//log.info( "aaaaaa = " + chVisitList.size() );
		// Then
		//Assert.assertEquals( storId, cmStor.getStorId() );
		
		//List<ChVisit> chVisitList = chVisitRepo.findByVisitDtmContainingAndCmUsr_usrIdContaining( "", "" );
		
		//Pageable pageable 	= PageRequestCustom.of(ConstUtil.FIRST_PAGE, ConstUtil.PAGE_SIZE);
		//List<ChVisit> chVisitList = chVisitRepo.findByCmStor_cmStorSeqAndVisitDtmBetweenAndCmUsr_usrIdContainingAndCmUsr_UsrNmContaining( 64L, ChkUtil.getMinDtm( "20200201000000" ), ChkUtil.getMaxDtm( "" ), "01012345678", "이재성", pageable );
				
		//Assert.assertTrue( chVisitList.size() > 0 );
		
	}
	
//	@Test
	public void testJoin2() throws Exception {
		
		// Given ------------------------------------------------------------------------------------------
		CmUsr cmUsr = new CmUsr();
		cmUsr.setCmUsrSeq( 226L );
		
		CmStor cmStor = new CmStor();
		cmStor.setCmStorSeq( 64L );
		
		// When ------------------------------------------------------------------------------------------
		//CrUsrStor 	  crUsrStor		= crUsrStorRepo	.findByCmUsrAndCmStor( cmUsr, cmStor );
		//List<ChVisit> chVisitList 	= chVisitRepo	.findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining( null, null, null, "이재성", 1 );
		
		// Then ------------------------------------------------------------------------------------------
		//Assert.assertTrue( (chVisitList).get( 0 ).getCmUsr().getUsrNm().equals( "이재성" ) );
		
		//Assert.assertTrue( crUsrStor.getCmUsr().getUsrNm().equals( "이재성" ) );

		//log.info( "aaaaaa = " + chVisitList.toString() );
		//log.info( "aaaaaa = " + chVisitList.size() );
		// Then
		//Assert.assertEquals( storId, cmStor.getStorId() );
		//Assert.assertTrue( chVisitList.size() > 0 );
		
	}
	
	@Test
	public void testCmStorRepo() throws Exception {
		
		// Given ------------------------------------------------------------------------------------------
		String usrId 		= "01011111234";
		String telNo 		= "";
		String storNm 		= "";
		String natiCd 		= "KR";
		String sType 		= "";
		boolean isVisited 	= false;
		Pageable pageable 	= PageRequestCustom.of(1, ConstUtil.PAGE_SIZE);
		
		// When ------------------------------------------------------------------------------------------
		Map<String,Object> map = cmStorRepo.findByTelNoContainingAndStorNmContainingAndNatiCd( usrId, telNo, storNm, natiCd, isVisited, sType, pageable );
		
		// Then ------------------------------------------------------------------------------------------
		Assert.assertTrue( map.size() > 0 );
		
	}
	
//	@Test
	public void testOverridedMethod() throws Exception {
		
		// Given ------------------------------------------------------------------------------------------
		CmUsr cmUsr = new CmUsr();
		cmUsr.setCmUsrSeq( 226L );
		
		CmStor cmStor = new CmStor();
		cmStor.setCmStorSeq( 64L );
		
		// When ------------------------------------------------------------------------------------------
		List<CmUsr>		cmUsrList 		= cmUsrRepo.findAll();
		List<CmStor> 	cmStorList 		= cmStorRepo.findAll();
		//List<ChVisit> chVisitList 	= chVisitRepo	.findVisitDtmContainingAndfindUsrIdContainingAndUsrNmContaining( null, null, null, "이재성" );
		List<ChVisit> 	chVisitList 	= chVisitRepo.findAll();
		List<CrUsrStor> crUsrStorList 	= crUsrStorRepo.findAll();
		
		// Then ------------------------------------------------------------------------------------------
		log.info( "aaaaaaaaaaaaaaaaaaaaa 1 = " + cmUsrList		.toString() );
		log.info( "aaaaaaaaaaaaaaaaaaaaa 2 = " + cmStorList		.toString() );
		log.info( "aaaaaaaaaaaaaaaaaaaaa 3 = " + chVisitList	.toString() );
		log.info( "aaaaaaaaaaaaaaaaaaaaa 4 = " + crUsrStorList	.toString() );
		
		//Assert.assertTrue( crUsrStor.getCmUsr().getUsrNm().equals( "이재성" ) );
		
		//log.info( "aaaaaa = " + chVisitList.toString() );
		//log.info( "aaaaaa = " + chVisitList.size() );
		// Then
		//Assert.assertEquals( storId, cmStor.getStorId() );
		//Assert.assertTrue( chVisitList.size() > 0 );
		
	}
	
}