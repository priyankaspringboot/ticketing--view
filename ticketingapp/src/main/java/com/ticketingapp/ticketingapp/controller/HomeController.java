package com.ticketingapp.ticketingapp.controller;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMultipart;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;

@Controller
public class HomeController {

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/")
	public ModelAndView test(HttpServletResponse response) throws IOException {
		return new ModelAndView("home");
	}

	@RequestMapping(path = "/home")
	public ModelAndView homepage(HttpServletResponse response) throws IOException {
		return new ModelAndView("home");
	}

	@RequestMapping(path = "/tickets")
	public ModelAndView viewtickets() throws IOException {
		return new ModelAndView("tickets");
	}

	@RequestMapping(path = "/mail")
	public ModelAndView mail() throws IOException {
		return new ModelAndView("mail");
	}

	@RequestMapping(value = "/EmailSendingServlet", method = RequestMethod.POST)
	public ModelAndView doSendEmail(HttpServletRequest request) {
		// takes input from e-mail form
		String toMail = request.getParameter("tomail");
		String subject = request.getParameter("subject");
		String body = request.getParameter("body");

		// printing mail info
		System.out.println("To: " + toMail);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + body);
		try {
			// creates a simple e-mail object
			SimpleMailMessage email = new SimpleMailMessage();

			email.setTo(toMail);
			email.setSubject(subject);
			email.setText(body);

			System.out.println(email);

			// sending email

			mailSender.send(email);
			
		}

		catch (Exception e) {
			return new ModelAndView("error");
		}
		return new ModelAndView("success");
	}
	
	@RequestMapping(value ="/emailReading", method= RequestMethod.GET)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		System.out.println("read mail method..");

		List<Map<String, String>> emails = new ArrayList<>();
		final String username = "priyanka99665@gmail.com";
		final String password = "dpwc unoz vlva rwcv";
		try {
			
			Session session = Session.getDefaultInstance(new Properties());
			Store store = session.getStore("imaps");
			store.connect("imap.gmail.com",username,password);
			
			Folder inbox = store.getFolder("INBOX");
			inbox.open(Folder.READ_ONLY);
			Message[] messages = inbox.getMessages();	
			for (Message message : messages) {
                Map<String, String> emailInfo = new HashMap<>();

                // Extract "From" address
                String from = ((InternetAddress) message.getFrom()[0]).getAddress();
                emailInfo.put("from", from);

                // Extract "Subject"
                String subject = message.getSubject();
                emailInfo.put("subject", subject);

                // Extract message content
                String messageContent;
                Object content = message.getContent();
                if (content instanceof String) {
                    // For text/plain content
                    messageContent = (String) content;
                } else if (content instanceof MimeMultipart) {
                    // For multipart content, assuming text/plain part
                    MimeMultipart multipart = (MimeMultipart) content;
                    BodyPart bodyPart = multipart.getBodyPart(0); // Assuming text/plain is the first part
                    messageContent = (String) bodyPart.getContent();
                } else {
                    messageContent = "Unsupported content type";
                }
                emailInfo.put("messageContent", messageContent);

                // Add email information to the list
                emails.add(emailInfo);
            }

            inbox.close(true);
            store.close();
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
		}
		// Pass email information to JSP
        request.setAttribute("emails", emails);

        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("tickets");
        dispatcher.forward(request, response);    
		
    } 
	 
}
