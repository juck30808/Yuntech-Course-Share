package librarySystem;

import java.util.ArrayList;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.event.ActionEvent; 
public class InitialController {
	@FXML
    private TextField UserID;
	@FXML
    private TextField Password;
	@FXML
    private Button LoginButton;
	@FXML
    private Button GuestButton;
	public void onButtonClick(ActionEvent event)
	{
		String ID=UserID.getText();
		String password=Password.getText();
		ArrayList<Librarian> storeLibrarian=new ArrayList<Librarian>();
		ArrayList<Member> storeMember=new ArrayList<Member>();
		Librarian checkLibrairan = new Librarian();
		Member checkMember = new Member();
		try
		{
		char beginChar=ID.charAt(0);
		if(beginChar=='L')
		{
			storeLibrarian=LibraryDBMgr.searchData(ID,"librarian");
			checkLibrairan=storeLibrarian.get(0);
			if(password.equals(checkLibrairan.getlibrarianPassword()))
			{
				tiggerLibrarianGUI();
				final Node source = (Node) event.getSource();
				final Stage stage = (Stage) source.getScene().getWindow();
				stage.close();
			}
			else if(checkLibrairan.getlibrarianPassword() == null)
			{
				Alert alert = new Alert(AlertType.ERROR);
		        alert.setTitle("Error");
		        alert.setHeaderText("Can not find Librarian account");
		        alert.showAndWait();
			}
			else
			{
				Alert alert = new Alert(AlertType.ERROR);
		        alert.setTitle("Error");
		        alert.setHeaderText("Can not login(Wrong Password)");
		        alert.showAndWait();
			}
		}
		else if(beginChar=='M')
		{
			String table= new String("member");
			storeMember=LibraryDBMgr.searchData(ID,table);
			checkMember=storeMember.get(0);
			if(password.equals(checkMember.getmemberPassword()))
			{
				tiggerMemberGUI();
				InitialGUI.setloginMember(checkMember);
				final Node source = (Node) event.getSource();
				final Stage stage = (Stage) source.getScene().getWindow();
				stage.close();
			}
			else if(checkMember.getmemberPassword() == null)
			{
				Alert alert = new Alert(AlertType.ERROR);
		        alert.setTitle("Error");
		        alert.setHeaderText("Can not find Member account");
		        alert.showAndWait();
			}
			else
			{
				Alert alert = new Alert(AlertType.ERROR);
		        alert.setTitle("Error");
		        alert.setHeaderText("Can not login(Wrong Password)");
		        alert.showAndWait();
			}
		}
		}
		catch(Exception e)
		{
			Alert alert = new Alert(AlertType.ERROR);
	        alert.setTitle("Error");
	        alert.setHeaderText("No success use function");
	        alert.showAndWait();
		}
	}
	public void tiggerMemberGUI()
	{
		try
		{
			MemberGUI memberGUI=new MemberGUI();  
			memberGUI.showWindow();
		}catch(Exception e)
		{
		}
	
	}
	public void tiggerSearchGUI()
	{
		InitialGUI.setloginMember(null);
		Search.main(null);
	}
	public void tiggerLibrarianGUI()
	{
		try
		{
		InitialGUI.setloginMember(null);
		LibrarianGUI librarianGUI=new LibrarianGUI();  
		librarianGUI.showWindow(); 
		}catch(Exception e)
		{
		}
	}
}
