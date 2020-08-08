//Factory Pattern Example: DBConnection Factory

Interface: DBConnection

package db.connection;

public interface DBConnection {
	void getConnection();

}

Class: MySQLDBConnection

package db.connection;

public class MySQLDBConnection implements DBConnection {
	public void getConnection(){
		System.out.println("MySQL DB is connected");
	}

}

Class: JavaDBConnection

package db.connection;

public class JavaDBConnection implements DBConnection{
	public void getConnection(){
		System.out.println("Java DB is connected");
	}

}

Class: OracleDBConnection

package db.connection;

public class OracleDBConnection implements DBConnection{
	public void getConnection(){
		System.out.println("Oracle DB is connected");
	}

}

Interface: DBConnectionFactory

package db.connection;

public interface DBConnectionFactory {
	DBConnection createConnection();

}

Interface: MyDBConnectionFactory

package db.connection;

public class MyDBConnectionFactory implements DBConnectionFactory{
	private String type;
	public MyDBConnectionFactory(String type){
		this.type=type;
	}
	
	public DBConnection createConnection(){
		if (type.equalsIgnoreCase("Oracle")){
			return new OracleDBConnection();
		} else if (type.equalsIgnoreCase("MySQL")){
			return new MySQLDBConnection();
			} else if (type.equalsIgnoreCase("JavaDB")){
				return new JavaDBConnection();
			} else {
				//default product
				return new OracleDBConnection();
				
			}
		}
	}


Class: Main

package db.connection;

public class Main {

	public static void main(String[] args) {
		MyDBConnectionFactory factory = new MyDBConnectionFactory("JavaDB");
		factory.createConnection().getConnection();
		
		factory = new MyDBConnectionFactory("MySQL");
		factory.createConnection().getConnection();
		
		factory = new MyDBConnectionFactory("Oracle");
		factory.createConnection().getConnection();

	}

}

Result:

Java DB is connected
MySQL DB is connected
Oracle DB is connected

