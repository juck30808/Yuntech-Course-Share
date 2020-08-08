package librarySystem;
import java.util.Date;
public class PaperBook extends book{
private String state;
private String borrower;
private int price;
private Date borrowerTime;
public void view()
{
}
public void setPaperBook(
String IbookID,
String IbookTitle,
String Iaurhor,
String Ipublisher,
String IpublicationDate,
String Isummary,
String Istate,
String Iborrower,
int Iprice,
Date IborrowerTime
)
{
	super.bookID=IbookID;
	super.bookTitle=IbookTitle;
	super.aurhor=Iaurhor;
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
public String getaurhor() 
{
	return (super.aurhor);
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
