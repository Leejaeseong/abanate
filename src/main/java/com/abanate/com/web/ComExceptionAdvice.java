package com.abanate.com.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.abanate.mycoup.service.MycoupPreLoadService;

/**
 * [참조]
 * https://www.slipp.net/questions/600
 * https://hellokiseok.tistory.com/entry/ExceptionHandler-%EC%82%AC%EC%9A%A9%EB%B2%95-ContentType-%EB%B3%84-%EC%B2%98%EB%A6%AC
 */
@ControllerAdvice(annotations = Controller.class)
public class ComExceptionAdvice {

	@Value( "${setting_api_recaptcha_site_key}" )
	public String SETTING_API_RECAPTCHA_SITE_KEY;
	
	/**
	 * Http exception
	 */
	@ExceptionHandler({ComException.class, MethodArgumentNotValidException.class, BindException.class})
	public ModelAndView errorException(Exception e, HttpServletRequest request, HttpServletResponse response ) {
		ModelAndView model=null;
		//model.addAttribute("exception", e);
		
		String contentType	= request.getHeader("Content-Type");
		String reason		= HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase();
		String msg 			= e.getMessage(); 
	    int statusCode		= HttpStatus.INTERNAL_SERVER_ERROR.value();

		// Content-Type 확인, json 만 View를 따로 처리함.
	    if(contentType!=null && MediaType.APPLICATION_JSON_VALUE.equals(contentType)){
        	model = new ModelAndView("com/jsonException");
            ResponseStatus annotation = e.getClass().getAnnotation(ResponseStatus.class);
 
            if(annotation!=null){
                reason = annotation.reason();
                statusCode = annotation.value().value();
            }
        } else { //json 이 아닐경우
        	// ComException이거나 Validation 오류인 경우 원래 페이지로 이동
        	if( e instanceof ComException || e instanceof MethodArgumentNotValidException || e instanceof BindException ) {	
        		model = new ModelAndView( request.getRequestURI().substring( 1 ).substring( 0, request.getRequestURI().substring( 1 ).lastIndexOf( ".do" ) ) );
        		if( e instanceof BindException ) {	// BindException인 경우 첫번째 바인드 오류 부분을 메시지에 담음
        			msg = ( ( BindException )e ).getAllErrors().get( 0 ).getDefaultMessage();
        		}
        		
        	} else {	// error page 로 이동        
        		model = new ModelAndView("com/exception");
        	}
        }

		model.addObject("errReason"		,reason);
        model.addObject("errStatusCode"	,statusCode);
        model.addObject("errMsg"		,msg);
        model.addObject("isError"		,true);
        model.addObject( "setting_api_recaptcha_site_key", SETTING_API_RECAPTCHA_SITE_KEY );
        response.setStatus(statusCode);

        return model;
	}

}