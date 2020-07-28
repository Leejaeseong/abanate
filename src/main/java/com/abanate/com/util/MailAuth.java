package com.abanate.com.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import com.abanate.mycoup.service.MycoupPreLoadService;

public class MailAuth extends Authenticator {
	PasswordAuthentication pa;
	
	public MailAuth() {
		String mail_id = ConstUtil.MY_COUP_EMAIL;
		String mail_pw = MycoupPreLoadService.gmailPw;
		
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}