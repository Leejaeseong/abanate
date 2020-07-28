package com.abanate.mycoup.service;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import javax.transaction.Transactional;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.web.MycoupController;

/**
 * 참조 : https://zorba91.tistory.com/129
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/context-*.xml")
@Transactional
public class MycoupControllerTest {

	@Mock
	MycoupService mycoupService;
	
	// @InjectMocks : @Mock에 선언된 Service를 빈으로 주입
	@InjectMocks
	private MycoupController mycoupController;
	
	private ModelAndView 			mv;
	private MockMvc 				mockMvc;
	public  MockHttpServletRequest 	mockReq;
	public  MockHttpSession 		mockSess;
	
	@Before
	public void seUp() throws Exception {
		mv = new ModelAndView();
        		
		mockReq 	= new MockHttpServletRequest();
		mockSess 	= new MockHttpSession();
		mockReq.setSession( mockSess );
		RequestContextHolder.setRequestAttributes( new ServletRequestAttributes( mockReq ) );
		
		// @Autowired 역할 수행
		MockitoAnnotations.initMocks( this );
		
		// 컨트롤러를 MockMvc 객체로 등록
		mockMvc = MockMvcBuilders.standaloneSetup( mycoupController ).build();
	}
	
//	@Test
	public void testRegistDo() throws Exception {
		
		// Given
		
		// When
		mockMvc.perform(post("/mycoup/joinMember.do")
				.session(mockSess)
				.param( "usrId"			, "01032281234"	)
				.param( "usrNm"			, "테스터1"		)
				.param( "passwd"		, "aaaaa" 		)
				.param( "natiCd"		, "KOR" 		)
				.param( "marketAgreeYn"	, "Y" 			)
				.param( "usrTp"			, "S" 			)
				
				.param( "storNm"		, "테스트점포1" )
				.param( "storId"		, "01032281234" )
//							.param( "telNo"	 		, "0103228123a" )
				.param( "savTp"			, "C"			)
				)
		;
		
		// Then
				
	}
	
	@Test
	public void testVisitHistory() throws Exception {
		
		// Given
		CmStor cmStor = new CmStor();
		cmStor.setCmStorSeq( 1L );
		mockSess.setAttribute( "cmStor", cmStor );
		
		// When
		mockMvc.perform(
						 post		("/mycoup/findVisitHistory.json"	)
						.session	( mockSess							)
						.contentType( MediaType.APPLICATION_JSON_UTF8 	)
						.content	( "{fDt:'20200101',tDt:'20200225'}"	)	            
					   )
		    .andExpect(status().isOk())			
		;
		
		// Then
		
	}
	
}