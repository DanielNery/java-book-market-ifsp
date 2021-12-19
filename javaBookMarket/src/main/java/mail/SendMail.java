package mail;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMail {
	
	private Properties properties = new Properties();
	private Session    session	  = null;		
	
	public SendMail(String smtpHost, String smtpPort, String username, String password, String auth /* none:25, tls:587, ssl:465  */) {
		this.properties.put("mail.smtp.host", smtpHost);
		this.properties.put("mail.smtp.port", smtpPort);
		
		if (auth.toLowerCase().equals("tls")){
			this.properties.put("mail.smtp.starttls.enable", "true");
			this.properties.put("mail.smtp.auth", "true");
		}

		if (auth.toLowerCase().equals("ssl")){
			this.properties.put("mail.smtp.socketFactory.port", smtpPort);
			this.properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			this.properties.put("mail.smtp.auth", "true");
		}
		
		if (auth.toLowerCase().equals("none")){
			this.properties.put("mail.smtp.auth", "false");
		}
		
		this.session = 
				Session.getInstance(
					properties,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}
					}
				);
	}
	
	public void send(String mailFrom, String mailTo, String mailSubject, String mailBody  ) {
		try {
			Message message = new MimeMessage( this.session );
			message.setFrom( new InternetAddress(mailFrom) );
			message.setRecipients( Message.RecipientType.TO, InternetAddress.parse(mailTo) );
			message.setSubject( mailSubject	);
			message.setText(    mailBody	);
			Transport.send(     message		);
			System.out.println("Email Enviado!");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	
	}

}

/*	
 *	Exemplo para Google: 
 *		Host:	smtp.gmail.com 
 *		porta:	465, se estiver usando o SSL 
 *		porta: 	587, se estiver usando o TLS
 *	
 *	Secure Socket Layer (SSL) é um padrão global em tecnologia de segurança desenvolvida pela Netscape em 1994. 
 *	Ele cria um canal criptografado entre um servidor web e um navegador (browser) para garantir que todos os 
 *	dados transmitidos sejam sigilosos e seguros. 
 * 
 * 	O TLS (Transport Layer Security) é um protocolo criptográfico cuja função é conferir segurança para a 
 * 	comunicação na Internet para serviços como email (SMTP), navegação por páginas (HTTP) e outros tipos de 
 * 	transferência de dados.
 * 
 * 	O TLS tem a capacidade de trabalhar em portas diferentes e usa algoritmos de criptografia mais fortes como 
 * 	o keyed-Hashing for Message Authentication Code (HMAC) enquanto o SSL apenas Message Authentication Code (MAC). 
 * 
 */
