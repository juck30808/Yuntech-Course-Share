package librarySystem;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.io.*;
public class LibraryDBMgr {
	public static void editData(String editID,ArrayList input,String editTable)
	{
		ArrayList<Librarian> ALibrarian=new ArrayList<Librarian>();
		ArrayList<Member> AMember=new ArrayList<Member>();
		ArrayList<Ebook> AEbook=new ArrayList<Ebook>();
		ArrayList<PaperBook> APaperBook=new ArrayList<PaperBook>();
		Connection conn = null;
			try {
					Class.forName("com.mysql.jdbc.Driver");
					String datasource="jdbc:mysql://localhost/library?user=kendy&password=ken033580964";
					conn = DriverManager.getConnection(datasource);
					System.out.println("成功");
					Statement st = conn.createStatement();
					if(editTable.equals("librarian"))
					{
						Librarian storeLibrarian=new Librarian();
						ALibrarian=input;
						storeLibrarian=ALibrarian.get(0);
						String SQL = String.format("Update librarian Set LibrarianID='%s',LibrarianPassword='%s' Where LibrarianID='%s')",storeLibrarian.getlibrairanID(),storeLibrarian.getlibrarianPassword(),editID);
						st.execute(SQL);
						st.close();
					}
					else if(editTable.equals("member"))
					{
						Member storeMember=new Member();
						AMember=input;
						storeMember=AMember.get(0);
						String SQL = String.format("Update member Set"+
								"memberID=%s"+
								"memberPassword=%s"+
								"email=%s"+
								"numberofBorrowBook=%d"+
								"numberOfOverdueBook=%d"+
								"numberOfNoticeBook=%d"+
								"right=%b"+ 
								"Where LibrarianID='%s'"
								,storeMember.getmemberID()
								,storeMember.getmemberPassword()
								,storeMember.getmemberemail()
								,storeMember.getnumberOfBorrowBook()
								,storeMember.getnumberOfOverdueBook()
								,storeMember.getnumberOfNoticeBook()
								,storeMember.getright()
								,editID
								);
						st.execute(SQL);
						st.close();
					}
					else if(editTable.equals("paperbook"))
					{
						PaperBook storePaperBook=new PaperBook();
						APaperBook=input;
						storePaperBook=APaperBook.get(0);
						PreparedStatement pstmt;
						int paperbookid = Integer.parseInt(editID);
						SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String sGMT = sf.format(storePaperBook.getborrowerTime());
						java.sql.Timestamp createDate = Timestamp.valueOf(sGMT);
						String SQL = "Update paperbook Set (bookTitle,author,publisher,publicationDate,summary,state,borrower,borrowerTime,price) Where (bookID) VALUES (?,?,?,?,?,?,?,?,?,?)";
						pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1,storePaperBook.getbookTitle());
						pstmt.setString(2,storePaperBook.getauthor());
						pstmt.setString(3,storePaperBook.getpublisher());
						pstmt.setString(4,storePaperBook.getpublicationDate());
						pstmt.setString(5,storePaperBook.getsummary());
						pstmt.setString(6,storePaperBook.getstate());
						pstmt.setString(7,storePaperBook.getborrower());
						pstmt.setTimestamp(8,createDate);
						pstmt.setInt(9,storePaperBook.getprice());
						pstmt.setInt(10,paperbookid);
						pstmt.execute();
						SQL = String.format("SELECT LAST_INSERT_ID( )");
						st.execute(SQL);
						pstmt.close();
						st.close();
					}
					else if(editTable.equals("ebook"))
					{
						PreparedStatement pstmt ;
						Ebook storeEbook=new Ebook();
						AEbook=input;
						storeEbook=AEbook.get(0);
						int ebookid = Integer.parseInt(editID);
						String SQL = "Update ebook (bookTitle,aurhor,publisher,publicationDate,summary,bookContext) Where (bookID) VALUES (?,?,?,?,?,?,?)";
						pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1,storeEbook.getbookTitle());
						pstmt.setString(2,storeEbook.getauthor());
						pstmt.setString(3,storeEbook.getpublisher());
						pstmt.setString(4,storeEbook.getpublicationDate());
						pstmt.setString(5,storeEbook.getsummary());
						InputStream inputs = null ;
				        inputs = new FileInputStream(storeEbook.getbookContext());
				        pstmt.setAsciiStream(6,inputs,(int)storeEbook.getbookContext().length());
				        pstmt.setInt(7,ebookid);
						pstmt.execute();
						SQL = String.format("SELECT LAST_INSERT_ID( )");
						st.execute(SQL);
						pstmt.close();
						st.close();
					}
					
			}
		catch(Exception e)
		{
		System.out.println("無法寫入");
		}
	}
	
	public static void addData(ArrayList input,String addTable)
	{
		ArrayList<Librarian> ALibrarian=new ArrayList<Librarian>();
		ArrayList<Member> AMember=new ArrayList<Member>();
		ArrayList<Ebook> AEbook=new ArrayList<Ebook>();
		ArrayList<PaperBook> APaperBook=new ArrayList<PaperBook>();
		Connection conn = null;
			try {
					Class.forName("com.mysql.jdbc.Driver");
					String datasource="jdbc:mysql://localhost/library?user=kendy&password=ken033580964";
					conn = DriverManager.getConnection(datasource);
					System.out.println("成功");
					Statement st = conn.createStatement();
					if(addTable.equals("librarian"))
					{
						Librarian storeLibrarian=new Librarian();
						ALibrarian=input;
						storeLibrarian=ALibrarian.get(0);
						String SQL = String.format("INSERT INTO librarian VALUES ('%s', '%s')",storeLibrarian.getlibrairanID(),storeLibrarian.getlibrarianPassword());
						st.execute(SQL);
						st.close();
					}
					else if(addTable.equals("member"))
					{
						Member storeMember=new Member();
						AMember=input;
						storeMember=AMember.get(0);
						String SQL = String.format("INSERT INTO member VALUES ('%s', '%s','%s','%d','%d','%d','%b')"
								,storeMember.getmemberID()
								,storeMember.getmemberPassword()
								,storeMember.getmemberemail()
								,storeMember.getnumberOfBorrowBook()
								,storeMember.getnumberOfOverdueBook()
								,storeMember.getnumberOfNoticeBook()
								,storeMember.getright()
								);
						st.execute(SQL);
						st.close();
					}
					else if(addTable.equals("paperbook"))
					{
						PaperBook storePaperBook=new PaperBook();
						APaperBook=input;
						storePaperBook=APaperBook.get(0);
						PreparedStatement pstmt;
						
						SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String sGMT = sf.format(storePaperBook.getborrowerTime());
						java.sql.Timestamp createDate = Timestamp.valueOf(sGMT);
						String SQL = "INSERT INTO paperbook (bookTitle,author,publisher,publicationDate,summary,state,borrower,borrowerTime,price) VALUES (?,?,?,?,?,?,?,?,?)";
						pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1,storePaperBook.getbookTitle());
						pstmt.setString(2,storePaperBook.getauthor());
						pstmt.setString(3,storePaperBook.getpublisher());
						pstmt.setString(4,storePaperBook.getpublicationDate());
						pstmt.setString(5,storePaperBook.getsummary());
						pstmt.setString(6,storePaperBook.getstate());
						pstmt.setString(7,storePaperBook.getborrower());
						pstmt.setTimestamp(8,createDate);
						pstmt.setInt(9,storePaperBook.getprice());
						pstmt.execute();
						SQL = String.format("SELECT LAST_INSERT_ID( )");
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						InitialGUI.setmaxID(rs.getInt("bookID"));
						pstmt.close();
						st.close();
					}
					else if(addTable.equals("ebook"))
					{
						PreparedStatement pstmt ;
						Ebook storeEbook=new Ebook();
						AEbook=input;
						storeEbook=AEbook.get(0);
						String SQL = "INSERT INTO ebook (bookTitle,aurhor,publisher,publicationDate,summary,bookContext) VALUES (?,?,?,?,?,?)";
						pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1,storeEbook.getbookTitle());
						pstmt.setString(2,storeEbook.getauthor());
						pstmt.setString(3,storeEbook.getpublisher());
						pstmt.setString(4,storeEbook.getpublicationDate());
						pstmt.setString(5,storeEbook.getsummary());
						InputStream inputs = null ;
				        inputs = new FileInputStream(storeEbook.getbookContext());
				        pstmt.setAsciiStream(6,inputs,(int)storeEbook.getbookContext().length());
						pstmt.execute();
						SQL = String.format("SELECT LAST_INSERT_ID( )");
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						InitialGUI.setmaxID(rs.getInt("bookID"));
						pstmt.close();
						st.close();
					}
					
			}
		catch(Exception e)
		{
		System.out.println("無法寫入");
		}
	}

	
	public static ArrayList searchData(String inputID,String usefunction) throws ClassNotFoundException
	{
		//搜尋功能(搜尋值,哪一種功能)
		ArrayList<Object> searchList = new ArrayList<Object>();
		Connection conn = null;
			try {
					Class.forName("com.mysql.jdbc.Driver");
					String datasource="jdbc:mysql://localhost/library?user=kendy&password=ken033580964";
					conn = DriverManager.getConnection(datasource);
					System.out.println("成功");
					Statement st = conn.createStatement();
					if(usefunction.equals("librarian"))//搜尋librarian
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
						st.close();
					}
					else if(usefunction.equals("member"))//搜尋member
					{
						Member m1=new Member();
						String SQL = String.format("SELECT * FROM member Where memberID = '%s' ",inputID);
						System.out.println("成功搜尋member");
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						if(searchList.isEmpty())
						{
							while(rs.next())
							{
								boolean MR;
								int i=rs.getInt("right");
								if(i==1)
								{
									MR=true;
								}
								else
								{
									MR=false;
								}
								m1.setMember(rs.getString("memberID"), rs.getString("memberPassword"),rs.getString("email"),rs.getInt("numberofBorrowBook"),rs.getInt("numberOfOverdueBook"),rs.getInt("getnumberOfNoticeBook"),MR);                            
							}
							System.out.println("搜尋成功");
							searchList.add(m1);
						}
						else
						{
							searchList.remove(0);
							boolean MR;
							int i=rs.getInt("right");
							if(i==1)
							{
								MR=true;
							}
							else
							{
								MR=false;
							}
							while(rs.next())
							{
								m1.setMember(rs.getString("memberID"), rs.getString("memberPassword"),rs.getString("email"),rs.getInt("numberofBorrowBook"),rs.getInt("numberOfOverdueBook"),rs.getInt("getnumberOfNoticeBook"),MR);                            
							}
							System.out.println("搜尋成功");
							searchList.add(m1);
						}
						st.close();
					}
					else if(usefunction.equals("searchpaperbook"))//用id搜尋paperbook
					{
						PaperBook p1=new PaperBook();
						int paperbookid = Integer.parseInt(inputID);
						String SQL = String.format("SELECT * FROM paperbook Where bookID = '%d' ",paperbookid);
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						if(searchList.isEmpty())
						{
							while(rs.next())
							{
								
								p1.setPaperBook(rs.getString("bookID"),
										rs.getString("bookTitle"),
										rs.getString("author"),
										rs.getString("publisher"),
										rs.getString("publicationDate"),
										rs.getString("summary"),
										rs.getString("state"),
										rs.getString("borrower"),
										rs.getTimestamp("borrowerTime"),
										rs.getInt("price"));      
							}
							System.out.println("搜尋成功");
							searchList.add(p1);
						}
						st.close();
					}
					else if(usefunction.equals("searchpkeyword"))//用關鍵字搜尋paperbook
					{
						String SQL = String.format("SELECT * FROM paperbook Where bookTitle = '%%s%' ",inputID);
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						if(searchList.isEmpty())
						{
							while(rs.next())
							{
								PaperBook p1=new PaperBook();
								p1.setPaperBook(rs.getString("bookID"),
										rs.getString("bookTitle"),
										rs.getString("author"),
										rs.getString("publisher"),
										rs.getString("publicationDate"),
										rs.getString("summary"),
										rs.getString("state"),
										rs.getString("borrower"),
										rs.getTimestamp("borrowerTime"),
										rs.getInt("price"));    
								System.out.println("搜尋成功");
								searchList.add(p1);
							}
						}
						st.close();
					}
					else if(usefunction.equals("searchebook"))//用id搜尋ebook
					{
						
						PreparedStatement pstmt ;
						Ebook E1=new Ebook();
						int Ebookid = Integer.parseInt(inputID);
						String SQL = String.format("SELECT * FROM ebook Where bookID = '%d'",Ebookid);
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						while(rs.next())
						{
							//想不到怎麼把longtext轉乘java有的值
							E1.setEbook(rs.getString("bookID"),
									rs.getString("bookTitle"),
									rs.getString("author"),
									rs.getString("publisher"),
									rs.getString("publicationDate"),
									rs.getString("summary"),
									null);      
						}
						System.out.println("搜尋成功");
						searchList.add(E1);
						st.close();
					}
					else if(usefunction.equals("searchekeyword"))//用關鍵字搜尋ebook
					{
						String SQL = String.format("SELECT * FROM ebook Where bookTitle = '%s'",inputID);
						st.execute(SQL);
						ResultSet rs=st.getResultSet();
						while(rs.next())
						{
							//想不到怎麼把longtext轉乘java有的值
							Ebook E1=new Ebook();
							E1.setEbook(rs.getString("bookID"),
									rs.getString("bookTitle"),
									rs.getString("author"),
									rs.getString("publisher"),
									rs.getString("publicationDate"),
									rs.getString("summary"),
									null);
							searchList.add(E1);
						}
						System.out.println("搜尋成功");
						st.close();
					}
			}
		catch(Exception e)
		{
		System.out.println("無法搜尋");
		}
			
			return searchList;
	}
}
