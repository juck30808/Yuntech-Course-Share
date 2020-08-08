package librarySystem;

import java.io.*;

public class Ebook extends book{
	private File bookContext;
	public void view()
	{
		//¬OGUIªü
	}
	
	public void setEbook(
	String IbookID,
	String IbookTitle,
	String Iaurhor,
	String Ipublisher,
	String IpublicationDate,
	String Isummary,
	File IbookContext
	)
	{
		super.bookID=IbookID;
		super.bookTitle=IbookTitle;
		super.author=Iaurhor;
		super.publisher=Ipublisher;
		super.publicationDate=IpublicationDate;
		super.summary=Isummary;
		bookContext=IbookContext;
	}
	
	public String getbookID() 
	{
		return (super.bookID);
	}
	public String getbookTitle() 
	{
		return (super.bookTitle);
	}
	public String getauthor() 
	{
		return (super.author);
	}
	public String getpublisher() 
	{
		return (super.publisher);
	}
	public String getpublicationDate() 
	{
		return (super.publicationDate);
	}
	public String getsummary() 
	{
		return (super.summary);
	}
	public File getbookContext() 
	{
		return bookContext;
	}
}
