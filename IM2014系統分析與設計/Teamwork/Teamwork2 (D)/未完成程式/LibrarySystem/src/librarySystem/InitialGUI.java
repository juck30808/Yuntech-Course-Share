package librarySystem;
import javax.swing.*;
public class InitialGUI {
	InitialGUI()
	{
		JFrame login=new JFrame("登入介面");
		JButton loginButtom = new JButton("登入");
		JTextField ID = new JTextField(15);
		JTextField password = new JTextField(15);
		JPanel plogin= new JPanel();
		plogin.add(new JLabel("輸入ID"));
		plogin.add(ID);
		plogin.add(new JLabel("輸入密碼"));
		plogin.add(password);
		plogin.add(loginButtom);
		loginButtom.addActionListener(event->
		{
			InitialController.checkUser(ID.getText(),password.getText());
		});
		login.add(plogin);
		login.pack();
		login.setVisible(true);
	}
}
