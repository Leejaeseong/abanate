package com.abanate.com.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseCookie;
import org.springframework.ui.Model;

import com.abanate.mycoup.domain.CmStor;
import com.abanate.mycoup.domain.CmUsr;

/**
 * Controller common util
 */
public class ControllerUtil {

	/**
	 * Set common model attibute
	 */
	public static Model setModel( Model model, HttpSession session, HttpServletRequest request ) {
		return model.addAttribute( "urlName", request.getRequestURI().substring( request.getRequestURI().lastIndexOf( "/" ) + 1 ).substring( 0, request.getRequestURI().substring( request.getRequestURI().lastIndexOf( "/" ) + 1 ).lastIndexOf( ".do" ) ) );
	}
	
	/**
	 * Check is login
	 */
	public static boolean isUsrLogin( HttpSession session ) {
		if( session.getAttribute( "cmUsr" ) != null && ((CmUsr)session.getAttribute( "cmUsr" )).getCmUsrSeq() != null ) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Check is login
	 */
	public static boolean isStorLogin( HttpSession session ) {
		if( session.getAttribute( "cmStor" ) != null && ((CmStor)session.getAttribute( "cmStor" )).getCmStorSeq() != null ) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Set cookie
	 */
	public static void setCookie( String domain, HttpServletResponse res, String key, String value ) {
		/*
		ResponseCookie cookie = ResponseCookie.from( key,  value )
	            //.domain( domain ) 
	            .sameSite("None")
	            .secure(true)
	            .path( domain )
	            .maxAge( 60 * 60 * 24 * 30 )	// 30 days)
	            .build();
		
		res.addHeader("Set-Cookie", cookie.toString());
		*/
		
		Cookie cookie = new Cookie( key, value );
		cookie.setPath( domain );
		cookie.setMaxAge( 60 * 60 * 24 * 30 );	// 30 days
		
		res.addCookie(cookie);
		
	}
	
	/**
	 * Remove all cookies
	 */
	public static void removeAllCookies( HttpServletResponse res, HttpServletRequest  req ) {
		Cookie[] cookies = req.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            cookie.setValue("");
	            cookie.setPath("/");
	            cookie.setMaxAge(0);
	            res.addCookie(cookie);
	        }
	    }
	}

}