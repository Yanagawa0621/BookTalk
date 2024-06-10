package util;

import java.io.IOException;
import java.io.PrintStream;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


public class JavaMail {
// ---------------------------------------------------------基本資料

	private final static String userName = "ixlogic.wu@gmail.com"; // 寄件者信箱
	private final static String password = "ddjomltcnypgcstn"; // 寄件者密碼
	//private String customer = "tpshherman123@yahoo.com.tw"; // 收件者郵箱
	private final static String subject = "請查收不可說 (Book Talk)-客服中心回覆"; // 標題
	//private String txt = "<h1>郵件內容</h1><h2>文字內容</h2>"; // 內容
	public void SendMail() {}
	public static void SendMail(String customer,String txt) {
		// ---------------------------------------------------------連線設定
		Properties prop = new Properties();

		// 設定連線為smtp
		prop.setProperty("mail.transport.protocol", "smtp");

		// host主機:smtp.gmail.com
		prop.setProperty("mail.host", "smtp.gmail.com");

		// host port:465
		prop.put("mail.smtp.port", "465");

		// 寄件者帳號需要驗證：是
		prop.put("mail.smtp.auth", "true");

		// 需要安全資料傳輸層 (SSL)：是
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		// 安全資料傳輸層 (SSL) 通訊埠：465
		prop.put("mail.smtp.socketFactory.port", "465");

		// 顯示連線資訊
		prop.put("mail.debug", "true");

		// class
		Auth auth = new Auth(userName, password);
		Session session = Session.getDefaultInstance(prop, auth);

		// ---------------------------------------------------------Message郵件格式
		MimeMessage message = new MimeMessage(session);

		try {
			// 寄件者
			// 匿名類別
			// message.setSender(new InternetAddress(userName));

			// class
			InternetAddress sender = new InternetAddress(userName);
			message.setSender(sender);
			
			// 收件者
			message.setRecipient(RecipientType.TO, new InternetAddress(customer));
			
			// 標題
			message.setSubject(subject);
			
			// 內容/格式
			message.setContent(txt, "text/html;charset = UTF-8");
			
			
			// ---------------------------------------------------------Transport傳送Message
			Transport transport = session.getTransport();
			
			// transport將message送出
			transport.send(message);
			
			// 關閉Transport
			transport.close();
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}
	

  public static void main(String args[]) throws IOException {
	  
	  StringBuffer sb = new StringBuffer();
	  sb.append("<h2>先生/女士 您好 : </h4> </br>");
	  sb.append("<h4>你所申訴的的問題及回覆內容如下: </h4> </br>)");
	  //if(!"".eq(orderNumber)){
		//  sb.append("<h2>訂單編號:XXXX </h2> </br>)");
		  
	 // }		
	  sb.append("<h4>問題: </h4> </br>");
	 // sb.append("<h2>"+problemDescription +" </br>");
	  
	  JavaMail.SendMail("tpshherman123@yahoo.com.tw",sb.toString());
  }

}

class Auth extends Authenticator {

	private String userName;
	private String password;

	public Auth(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		PasswordAuthentication pa = new PasswordAuthentication(userName, password);
		return pa;
	}

}