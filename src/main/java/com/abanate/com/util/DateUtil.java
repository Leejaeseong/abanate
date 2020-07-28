package com.abanate.com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 날짜 유틸
 */
public class DateUtil {
	
	/**
	 * get Current Date
	 * @return Date
	 */
	public static Date getDate() {
		return new Date();
	}
	
	/**
	 * get Patterned date time with mark
	 * @param Pattern String
	 * @return String
	 */
	public static String getDateTimeStr() {
		return getDateStrPattern( ConstUtil.dateTimeFormatJava );
	}
	/**
	 * get Patterned date time without mark
	 * @param Pattern String
	 * @return String
	 */
	public static String getDateTimeStrNoMark() {
		return getDateStrPattern( ConstUtil.dateTimeFormatJavaNoMark );
	}
	
	/**
	 * get Patterned date with mark
	 * @param Pattern String
	 * @return String
	 */
	public static String getDateStr() {
		return getDateStrPattern( ConstUtil.dateFormatJava );
	}
	/**
	 * get Patterned date without mark
	 * @param Pattern String
	 * @return String
	 */
	public static String getDateStrNoMark() {
		return getDateStrPattern( ConstUtil.dateFormatJavaNoMark );
	}
	
	/**
	 * get Patterned date time
	 * @param Pattern String
	 * @return String
	 */
	public static String getDateStrPattern( String pattern ) {
		SimpleDateFormat sdf = new SimpleDateFormat( pattern );
		return sdf.format( DateUtil.getDate() );
	}
	
}