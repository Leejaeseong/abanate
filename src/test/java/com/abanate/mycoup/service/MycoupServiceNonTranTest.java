package com.abanate.mycoup.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/context-*.xml")
//@Transactional
public class MycoupServiceNonTranTest {

	@Autowired MycoupService mycoupService;
	
	//@Test( expected = Test.None.class /* no exception expected */ )
	@Test
	public void testJoinUsr() throws Exception {
		
		// Given
		CmUsr cmUsr = new CmUsr();
		cmUsr.setUsrId( "01014785236" );
		cmUsr.setUsrNm( "테스트1" );
		cmUsr.setPasswd( "aaa" );
		cmUsr.setNatiCd( "KOR" );
		cmUsr.setUsrTp( "U" );
		cmUsr.setMarketAgreeYn( "Y" );
		cmUsr.setJoinYn( "Y" );
		
		CmStor cmStor = new CmStor();
		cmStor.setStorId( "aaabbbcccc" );
		cmStor.setStorNm( "테스트1" );
		cmStor.setSavTp( "C");		
		
		HttpServletRequest mocReq = Mockito.mock(HttpServletRequest.class);
		MockHttpSession mocSess = new MockHttpSession();
		
		// When
		cmUsr = mycoupService.joinUsr( cmUsr, cmStor, mocSess, mocReq );
		
		// Then
		Assert.assertTrue( cmUsr.getUsrId() != null);
	}
	
}