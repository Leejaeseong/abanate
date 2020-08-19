package com.abanate.mycoup.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import com.abanate.com.util.ChkUtil;
import com.abanate.com.util.ConstUtil;
import com.abanate.com.util.ControllerUtil;
import com.abanate.mycoup.domain.CmNatiCd;
import com.abanate.mycoup.repo.CmNatiCdRepo;

// Transaction은 AOP로 처리 함

@Service
//@Transactional /** RuntimeException과 그 자식들인 언체크(Unchecked) 예외만 롤백한다. 만약 체크 예외가 발생해도 롤백하고 싶다면 rollbackFor로 Exception 지정 */
public class MycoupPreLoadService {
	
	@Autowired
	CmNatiCdRepo cmNatiCdRepo;
	
	private static List<CmNatiCd> cmNatiCdList = new ArrayList<CmNatiCd>();
	private static Map<String, String> eLang = new HashMap<String, String>();
	private static Map<String, String> kLang = new HashMap<String, String>();
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
	public void initMLang() {
		ClassPathResource resource = new ClassPathResource( "config/multi-language.properties" );
	    
		Properties props = null;
		try {			
			EncodedResource encodedResource = new EncodedResource(resource,"UTF-8");
			props = PropertiesLoaderUtils.loadProperties( encodedResource );
			for (String key : props.stringPropertyNames()) {
				if( key.startsWith( "k." ) ) {
					kLang.put( key.substring( 2 ), props.getProperty( key ) );					
				} else if( key.startsWith( "e." ) ) {
					eLang.put( key.substring( 2 ), props.getProperty( key ) );					
				}  
	        }
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	
	public Map<String, String> getMLang( HttpServletRequest  req, HttpServletResponse res ) {
		String usrLang = ControllerUtil.getCookie( "usrLang", "/mycoup/", req);
		if( ChkUtil.chkNull( usrLang ) && usrLang.equals( "ko-KR" ) ) {
			return kLang;
		} else {
			return eLang;
		}
	}
	
	public String getMMsg( String key, HttpServletRequest  req ) {
		String usrLang = ControllerUtil.getCookie( "usrLang", "/mycoup/", req);
		if( ChkUtil.chkNull( usrLang ) && usrLang.equals( "ko-KR" ) ) {
			return kLang.get( key );
		} else {
			return eLang.get( key );
		}
	}
	
}