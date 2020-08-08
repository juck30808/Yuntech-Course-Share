package librarySystem;

public class Librarian {
	private String librairanID;
	private String librarianPassword;
	public void setLibrarian(String lID,String lP)
	{
		librairanID=lID;
		librarianPassword=lP;
	}
	public String getlibrairanID() 
	{
		return librairanID;
	}
	public String getlibrarianPassword() 
	{
		return librarianPassword;
	}
}
