package com.abanate.com.web;

/**
 * 단순히 Validation exception인 경우
 * 원래 페이지로 전환하기 위한 용도
 */
public class ComException extends RuntimeException{

	private static final long serialVersionUID = -8992902854308292385L;

	public ComException(String message) {
		super(message);				
	}

}