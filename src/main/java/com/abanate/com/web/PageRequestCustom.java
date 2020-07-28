package com.abanate.com.web;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

/**
 * This class maded to make first page index to 1, not 0 in PareRequest
 * 
 * Below things tried but failed.
 * 1. Set resolver in file of commonservlet.xml.( oneIndexedParameters is not work properly, only first page index works as zero. )
 * 2. Set Spring data web, i.e. @Configureation. etc.
 * 
 * @author jaeseong_lee
 */
public class PageRequestCustom extends PageRequest {

	private static final long serialVersionUID = 4143123876782911351L;

	@SuppressWarnings("deprecation")
	public PageRequestCustom(int page, int size) {
		super(page, size);
	}

	/**
	 * First page index is 1, not 0 in PageRequest
	 * @param page
	 * @param size
	 * @return
	 */
	public static PageRequest of(int page, int size) {
		return of(page - 1, size, Sort.unsorted());
	}

}
