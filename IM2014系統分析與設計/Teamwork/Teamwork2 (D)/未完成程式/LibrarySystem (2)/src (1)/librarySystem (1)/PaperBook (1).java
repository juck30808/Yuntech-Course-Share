package librarySystem;
import java.util.Date;
public class PaperBook extends book{
private String state;
private String borrower;
private int price;
private Date borrowerTime;
public void view()
{
	//這也跟gui有關
}
public void setPaperBook(
String IbookID,
String IbookTitle,
String Iauthor,
String Ipublisher,
String IpublicationDate,
String Isummary,
String Istate,
String Iborrower,
Date IborrowerTime,
int Iprice
)
{
	super.bookID=IbookID;
	super.bookTitle=IbookTitle;
	super.author=Iauthor;
	super.publisher=Ipublisher;
	super.publicationDate=IpublicationDate;
	super.summary=Isummary;
	state=Istate;
	borrower=Iborrower;
	price=Iprice;
	borrowerTime=IborrowerTime;
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
public String getstate() 
{
	return state;
}
public String getborrower() 
{
	return borrower;
}
public int getprice() 
{
	return price;
}
public Date getborrowerTime() 
{
	return borrowerTime;
}
}
