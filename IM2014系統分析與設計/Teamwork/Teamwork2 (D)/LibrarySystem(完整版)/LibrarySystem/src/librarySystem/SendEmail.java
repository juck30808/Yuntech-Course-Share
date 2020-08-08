package librarySystem;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
public class SendEmail {
	public static void send(Member i) {
		// Get properties object
		String from = "kencs16358@gmail.com";
		String password = "*******要輸入";
		String to = i.getmemberemail();
		String sub = "圖書館通知";
		String msg = "" + i.getmemberName() + "會員您好，您目前有" + i.getnumberOfNoticeBook() + "本書快要逾期"
				+ i.getnumberOfOverdueBook() + "已經逾期，請盡快歸還，謝謝";
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		// get Session
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});
		// compose message
		try {
			MimeMessage message = new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);
			// send message
			Transport.send(message);
			System.out.println("message sent successfully");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
