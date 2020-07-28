package com.abanate.mycoup.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abanate.com.util.ConstUtil;
import com.abanate.mycoup.domain.CmNatiCd;
import com.abanate.mycoup.repo.CmNatiCdRepo;

// Transaction은 AOP로 처리 함

@Service
//@Transactional /** RuntimeException과 그 자식들인 언체크(Unchecked) 예외만 롤백한다. 만약 체크 예외가 발생해도 롤백하고 싶다면 rollbackFor로 Exception 지정 */
public class MycoupPreLoadService {
	
	@Autowired
	CmNatiCdRepo cmNatiCdRepo;
	
	private static List<CmNatiCd> cmNatiCdList = new ArrayList<CmNatiCd>();
	public static String gmailPw 				= "";
	public static String rechapchaSecretKey 	= "";
	public static String naverMapSecretKey 		= "";	// deprecated
	public static String googleMapKey 			= "";
	public static String koreaAddressKeyPc 		= "";	// deprecated
	public static String koreaAddressKeyMobile	= "";	// deprecated
	
	
	@PostConstruct
	private void initCmNatiCdList() {
		cmNatiCdList = cmNatiCdRepo.findAll();
	}
	
	@PostConstruct
	private void initLoadSecurityProperties() throws IOException {
		String osInfo = System.getProperty("os.name").toLowerCase();
		String filePath = ConstUtil.MY_COUP_AWS_PROP_PATH;
		if( osInfo.indexOf( "windows" ) != -1 ) {
			filePath = ConstUtil.MY_COUP_LOCAL_PROP_PATH;
		}
		
		// Load security properties
		FileInputStream fis = null;
		Properties prop = null;
	    try {
	    	fis = new FileInputStream( filePath );
	        prop = new Properties();
	        prop.load(fis);
	        
	        gmailPw = prop.getProperty( "gmail_pw" );
	        rechapchaSecretKey		= prop.getProperty( "setting_api_key_secret_recaptcha_secret" );
	        naverMapSecretKey 		= prop.getProperty( "setting_api_key_secret_naver_map" );
	        googleMapKey 			= prop.getProperty( "setting_api_key_google_map" );
	        koreaAddressKeyPc 		= prop.getProperty( "setting_api_address_key_pc" );
	        koreaAddressKeyMobile 	= prop.getProperty( "setting_api_address_key_mobile" );
	    } catch(FileNotFoundException fnfe) {
	    	fnfe.printStackTrace();
	    } catch(IOException ioe) {
	        ioe.printStackTrace();
	    } finally {
	    	fis.close();
	    }
	}
	
	public List<CmNatiCd> getCmNatiCdList() {
		return cmNatiCdList;
	}
	
}