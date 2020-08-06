package com.abanate.com.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail{
	public boolean sendMail( String email, String subject, String content ) {		
//	public static void main(String[] args) {
		boolean sendOk = false;
		Properties prop = System.getProperties();
		
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.debug", "true");
		
		// Session 생성
		Authenticator auth = new MailAuth();
		Session session = Session.getDefaultInstance(prop, auth);
		
		try {
			MimeMessage message = new MimeMessage(session);
			// 송신자
			message.setFrom(new InternetAddress( ConstUtil.MY_COUP_EMAIL, ConstUtil.MY_COUP_NAME ) );
			
			// 수신자
			InternetAddress to = new InternetAddress( email);
			
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject( subject, "UTF-8");						// 메일 제목 입력
			message.setContent(content, "text/html; charset=UTF-8");	// 메일 내용 입력
			
			Transport.send(message); // 전송
			System.out.println("message sent successfully");
			sendOk = true;
		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch(MessagingException me) {
			System.out.println("MessageException : " + me.getMessage());
		} catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		} finally {
			System.out.println("End");
		}
		
		return sendOk;
	}
}