package com.tech.sprj09.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender mailSender;
    
    public void sendEmail(String toAddress, String subject, String body, String fromAddress) {
    	System.out.println("============MailServiceImpl===========");
    	System.out.println(toAddress);
    	System.out.println(subject);
    	System.out.println(body);
    	System.out.println(fromAddress);
    	
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toAddress); // 수신자 설정
        message.setFrom(fromAddress); // 발신자 설정
        message.setSubject(subject); // 메일 제목
        message.setText(body); // 메일 내용
		try {
	        mailSender.send(message); // 메일 전송
		} catch (MailException e) {
			e.printStackTrace();
		}
    }
}