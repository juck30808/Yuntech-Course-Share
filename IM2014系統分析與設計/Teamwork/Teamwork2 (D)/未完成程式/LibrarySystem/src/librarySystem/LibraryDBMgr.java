package librarySystem;
import java.sql.*;
import java.util.ArrayList;
public class LibraryDBMgr {
	public static ArrayList searchData(String inputID,String searchTable) throws ClassNotFoundException
	{
		ArrayList searchList = new ArrayList();
		Connection conn = null;
			try {
					Class.forName("com.mysql.jdbc.Driver");
					String datasource="jdbc:mysql://localhost/library?user=kendy&password=ken033580964";
					conn = DriverManager.getConnection(datasource);
					System.out.println("成功");
					Statement st = conn.createStatement();
					if(searchTable.equals("librarian"))
					{
						Librarian r1=new Librarian();
						String SQL = String.format("SELECT * FROM librarian Where LibrarianID = '%s' ",inputID);
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						if(searchList.isEmpty())
						{
							while(rs.next())
							{
								r1.setLibrarian(rs.getString("LibrarianID"), rs.getString("LibrarianPassword"));
							}
							System.out.println("搜尋成功");
							searchList.add(r1);
						}
							else
							{
								searchList.remove(0);
								while(rs.next())
								{
									r1.setLibrarian(rs.getString("LibrarianID"), rs.getString("LibrarianPassword"));
								}
								System.out.println("搜尋成功");
								searchList.add(r1);
							}
					}
					else if(searchTable.equals("member"))
					{
						Member m1=new Member();
						String SQL = String.format("SELECT * FROM member Where memberID = '%s' ",inputID);
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						if(searchList.isEmpty())
						{
							while(rs.next())
							{
								m1.setMember(rs.getString("memberID"), rs.getString("memberPassword"),rs.getString("email"),rs.getInt("numberofBorrowBook"),rs.getInt("numberOfOverdueBook"),rs.getBoolean("right"));                            
							}
							System.out.println("搜尋成功");
							searchList.add(m1);
						}
							else
							{
									searchList.remove(0);
									while(rs.next())
									{
										m1.setMember(rs.getString("memberID"), rs.getString("memberPassword"),rs.getString("email"),rs.getInt("numberofBorrowBook"),rs.getInt("numberOfOverdueBook"),rs.getBoolean("right"));                            
									}
									System.out.println("搜尋成功");
									searchList.add(m1);
							}
					}
			}
		catch(Exception e)
		{
		System.out.println("無法搜尋");
		}
			return searchList;
	}
}
