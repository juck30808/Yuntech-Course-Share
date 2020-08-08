package librarySystem;

import java.sql.Timestamp;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Optional;
import java.util.TimeZone;
import librarySystem.InitialGUI;
import javax.swing.*;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.event.ActionEvent; 
public class MemberController {
	@FXML
	private Button searchBookButton;
	@FXML
	private Button borrowBookButton;
	public void searchBookButtonClick(ActionEvent event)
	{
		Search.main(null);
	}
	@FXML
	public void borrowBookButtonClick(ActionEvent event)
	{
		JFrame borrowFrame=new JFrame("借書介面");
		JButton b1 = new JButton("借書");
		JTextField ID = new JTextField(15);
		JPanel p= new JPanel();
		p.add(new JLabel("輸入書的ID"));
		p.add(ID);
		p.add(b1);
		borrowFrame.add(p);
		borrowFrame.pack();
		borrowFrame.setVisible(true);
		b1.addActionListener(ActionEvent->
		{
			Member checkMember = new Member();
			checkMember=InitialGUI.getloginMember();
			String table= new String("searchpaperbook");
			try
			{
			ArrayList<PaperBook> storePaperBook=new ArrayList<PaperBook>();
			PaperBook checkPaperBook=new PaperBook();
			storePaperBook=LibraryDBMgr.searchData(ID.getText(),table);
			checkPaperBook=storePaperBook.get(0);
			if(checkPaperBook==null)
			{
				 JOptionPane.showMessageDialog(borrowFrame,"can not find bookID",
                         "Error", JOptionPane.ERROR_MESSAGE);
			}
				else
				{
					System.out.println(checkPaperBook.getstate());
					if(checkPaperBook.getstate().equals("available"))
					{
						System.out.println("進入借書訊息");
						if(checkMember.getright()==true)
						{
							System.out.println("進入確認RIGHT");
						    int mType=JOptionPane.INFORMATION_MESSAGE;
						    int opt=JOptionPane.showConfirmDialog(borrowFrame,"您真的要借書嗎？","提示訊息",
						                                  JOptionPane.DEFAULT_OPTION,mType);
						    if (opt==JOptionPane.YES_OPTION)  {
								Date now = new Date();
								SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								String sGMT = sf.format(now);
								checkPaperBook.setbookState("borrowed");
								checkPaperBook.setBorrower(checkMember.getmemberID());
								checkPaperBook.setBorrowerTime(sGMT);
								ArrayList editpb=new ArrayList();
								editpb.add(checkPaperBook);
								String f="paperbook";
								String editID=checkPaperBook.getbookID();
								LibraryDBMgr.editData(editID,editpb,f);
								int x=checkMember.getnumberOfBorrowBook()+1;
								checkMember.setnumberOfBorrowBook(x);
								ArrayList editm=new ArrayList();
								editm.add(checkMember);
								LibraryDBMgr.editData(checkMember.getmemberID(),editm,"member");
								JOptionPane.showMessageDialog(borrowFrame,"成功借書",
		                                  "訊息", JOptionPane.INFORMATION_MESSAGE);
							} else if (opt==JOptionPane.NO_OPTION) {
								borrowFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
							}
						}
						else
						{
							 JOptionPane.showMessageDialog(borrowFrame,"you right is closed",
			                         "Error", JOptionPane.ERROR_MESSAGE);
							borrowFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
						}
					}
					else
					{
						JOptionPane.showMessageDialog(borrowFrame,"Book can not be borrowed",
		                         "Error", JOptionPane.ERROR_MESSAGE);
					}
				}
			}
			catch(Exception e)
			{
				
			}
		});
	}
}
