package com.abanate.mycoup.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// Refer URL	https://ifuwanna.tistory.com/223
//				https://victorydntmd.tistory.com/176
//				https://elfinlas.tistory.com/343
public class MycoupInterceptor extends HandlerInterceptorAdapter {
	// controller로 보내기 전에 처리하는 인터셉터
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler ) 
	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		
		return true;
	}

	// controller의 handler가 끝나면 처리됨
	@Override
	public void postHandle ( HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mav ) throws Exception {

		super.postHandle( req, res, handler, mav );
			
	}

	// view까지 처리가 끝난 후에 처리됨
	@Override
	public void afterCompletion(
			HttpServletRequest req, HttpServletResponse res,
			Object obj, Exception e)
			throws Exception {
		
	}
		
}