package com.tech.sprj09.service;

public interface MailService {

	void sendEmail(String toAddress, String subject, String body, String fromAddress);

}
