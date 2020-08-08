package librarySystem;
import javafx.application.*;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
public class InitialGUI extends Application{
		 public void start(Stage primaryStage) {
			 try {
			 FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("InitialGUI.fxml"));
			    Parent root = (Parent) fxmlLoader.load();
				Scene scene = new Scene(root);
				primaryStage.setTitle("InitialGUI");
				primaryStage.setScene(scene);
				primaryStage.show();
			 } catch(Exception e) {
					e.printStackTrace();
				}
		    }
		
		 public static void main(String[] args) 
		 { 
	        launch(args);
	    	
	     } 
		 static int maxID;
		 public static void setmaxID(int i)
	    	{
	    		maxID=i;
	    	}
		 public static int getmaxID(int i)
	    	{
	    		return maxID;
	    	}
}
