package librarySystem;
import javafx.application.Application;  
import javafx.fxml.FXMLLoader;  
import javafx.scene.Parent;  
import javafx.scene.Scene;  
import javafx.stage.Stage;
public class LibrarianGUI extends Application{
	Stage stage=new Stage(); 
	 public void start(Stage primaryStage) {
		 try {
		 FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("LibrarianGUI.fxml"));
		    Parent root = (Parent) fxmlLoader.load();
			Scene scene = new Scene(root);
			primaryStage.setTitle("LibrarianGUI");
			primaryStage.setScene(scene);
			primaryStage.show();
		 } catch(Exception e) {
				e.printStackTrace();
			}
	    }
	 public static void main(String[] args) { 

	        launch(args);

	    }
	 public void  showWindow()
	 {  
     start(stage);  
	 }
}
