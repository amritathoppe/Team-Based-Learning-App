package edu.umsl.java.beans;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {

	public void email(String subject, String body, String to) throws MessagingException {
		final String user = "fakeumslacc@gmail.com";
		final String password = "easypass";
	
		String from = "fakeumslacc@gmail.com";
	
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
	
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
	
		try {
	
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body);
	
			Transport.send(message);
			System.out.println("Done");
	
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}  
	   }
}
