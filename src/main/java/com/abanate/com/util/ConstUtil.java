package com.abanate.com.util;

/**
 * Constant utilies.
 */
public class ConstUtil {
	/**
	 * Define constant variables
	 * about application
	 */
	public final static String MY_COUP_EMAIL			= "MyCoup.ml@gmail.com";
	public final static String MY_COUP_NAME				= "MyCoupon";
	
	public final static String MY_COUP_AWS_PROP_PATH	= "/home/ec2-user/mycoup.properties";
	public final static String MY_COUP_LOCAL_PROP_PATH	= "D:/mycoup.properties";
	
	/**
	 * Define constant variables
	 * about web process
	 */
	public final static String AUTH_FAIL_PAGE		= "redirect:/mycoup/index.do";
	public final static String AUTH_FAIL_JSON		= "authentification is failed";
	public final static String NOT_EXIST_DATA		= "Not exist data";				// If would change this value then util.js is changed too.
	public final static String RECAPTCHA_FAIL		= "Recaptcha failed data";		// Data which didn't pass recaptcha validation.
	public final static float RECAPTCHA_SUCC_SCORE	= 0.5f;							// Score of recaptcha to recognize in human( not machine or robot to attack )
	
	/**
	 * Define constant variables about
	 * Date format string
	 */
	public final static String dateFormatHibernate 		= "YYYY.MM.DD HH24:MI:SS";
	public final static String dateTimeFormatJava 		= "yyyy.MM.dd HH:mm:ss";
	public final static String dateTimeFormatJavaNoMark = "yyyyMMddHHmmss";
	public final static String dateFormatJava 			= "yyyy.MM.dd HH:mm:ss";
	public final static String dateFormatJavaNoMark 	= "yyyyMMddHHmmss";
	
	/**
	 * Define constant variables
	 * about paging
	 */
	public final static int 	PAGE_SIZE	 	= 20;
	public final static int 	FIRST_PAGE  	=  1;
	public final static String 	FIRST_PAGE_STR	= String.valueOf( ConstUtil.FIRST_PAGE );
	
	/**
	 * Define constant variables
	 * about query.
	 */
	public final static String MIN_DTM = "20200101000000";
}