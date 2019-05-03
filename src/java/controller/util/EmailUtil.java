/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.util;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Boss
 */
public class EmailUtil {

    private static String emailSender="naima.khibane11@gmail.com";
    private static String passwordSender="zouaniensiaste1987";
//	public static void main(String[] args) {
//		EmailUtil crunchifyCheck = new EmailUtil();
// 
//		// Specify Boolean Flag
//		boolean isValid ;
// 
//		String email = "hello@hamza.com";
//		isValid = crunchifyCheck.emailValidate(email);
// 
//		email = "hello.hamza";
//		isValid = crunchifyCheck.emailValidate(email);
// 
//		email = "hello.hamza@";
//		isValid = crunchifyCheck.emailValidate(email);
//	}
//                
    public static boolean emailValidate(String email) {
        boolean isValid = false;
        try {
            //
            // Create InternetAddress object and validated the supplied
            // address which is this case is an email address.
            InternetAddress internetAddress = new InternetAddress(email);
            internetAddress.validate();
            isValid = true;
        } catch (AddressException e) {
            System.out.println(email + " is " + (isValid ? "a" : "not a") + " valid email address\n");
        }
        return isValid;
    }

    public static boolean sendMail( String message, String to, String subject) throws MessagingException {
        System.out.println("========= SEND MAIL ==========");
        String host = "smtp.gmail.com";
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", "gotodocproject@gmail.com");
        props.put("mail.smtp.password", "$$gotodoc$$");
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.connectiontimeout", 10000);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage mimeMessage = new MimeMessage(session);
//"gotodocproject@gmail.com", "$$gotodoc$$", message, to, subject
        try {
            mimeMessage.setFrom(new InternetAddress(emailSender));
//            InternetAddress[] toAdress=new InternetAddress[to.length];
//            for(int i=0;i<toAdress.length;i++){
            System.out.println("=== emailUtil ===");
            mimeMessage.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
//            }
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message, "UTF-8", "html");
            System.out.println("=== Content === <br/> " + mimeMessage.getContent());
            Transport transport = session.getTransport("smtp");

            transport.connect(host,emailSender,passwordSender);
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();
            return true;
        } catch (MessagingException me) {
            me.printStackTrace();
        } catch (IOException ex) {
            Logger.getLogger(EmailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
 
        return false;
    }
}
