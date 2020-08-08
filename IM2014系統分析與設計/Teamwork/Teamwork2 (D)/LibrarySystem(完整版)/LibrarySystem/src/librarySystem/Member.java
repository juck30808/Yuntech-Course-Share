package librarySystem;

public class Member {
	private String memberID;
	private String memberPassword;
	private String memberName;
	private String memberRepublicofChinaNationalID;
	private String memberemail;
	private int numberOfBorrowBook;
	private int numberOfOverdueBook;
	private int numberOfNoticeBook;
	private boolean right;
	public void setMember(String mID,String mP,String imemberName,String iMROCNID,String mm,int nobb,int noob,int nonb,boolean mauthor)
	{
		memberID=mID;
		memberPassword=mP;
		memberName=imemberName;
		memberRepublicofChinaNationalID=iMROCNID;
		memberemail=mm;
		numberOfBorrowBook=nobb;
		numberOfOverdueBook=noob;
		numberOfNoticeBook=nonb;
		right=mauthor;
	}
	public void setnumberOfBorrowBook(int i)
	{
		numberOfBorrowBook=i;
	}
	public void setnumberOfNoticeBook(int i)
	{
		numberOfNoticeBook=i;
	}
	public void setnumberOfOverdueBook(int i)
	{
		numberOfOverdueBook=i;
	}
	public void setright(boolean i)
	{
		right=i;
	}
	public String getmemberID() 
	{
		return memberID;
	}
	public String getmemberPassword() 
	{
		return memberPassword;
	}
	public String getmemberemail() 
	{
		return memberemail;
	}
	public int BorrowBook() 
	{
		return numberOfBorrowBook;
	}
	public int getnumberOfBorrowBook()
	{
		return numberOfBorrowBook;
	}
	public int getnumberOfOverdueBook() 
	{
		return numberOfOverdueBook;
	}
	public int getnumberOfNoticeBook() 
	{
		return numberOfNoticeBook;
	}
	public boolean getright() 
	{
		return right;
	}
	public String getmemberName() 
	{
		return memberName;
	}
	public String memberRepublicofChinaNationalID() 
	{
		return memberRepublicofChinaNationalID;
	}
}
