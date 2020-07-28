package com.abanate.com.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 클래스 생성때마다 재 생성하지 않는
 * 재사용 공통 로거
 * 참조 : https://stackoverflow.com/questions/33779127/loggerfactory-getloggerclassname-class-vs-loggerfactory-getloggerthis-getclas
 */
public class CustomLogger {
	
	 public static Logger getLogger() {
        final Throwable t = new Throwable();
        t.fillInStackTrace();
        return LoggerFactory.getLogger(t.getStackTrace()[1].getClassName());
    }
	
}