package librarySystem;

public class Member {
	private String memberID;
	private String memberPassword;
	private String memberemail;
	private int numberOfBorrowBook;
	private int numberOfOverdueBook;
	private int numberOfNoticeBook;
	private boolean right;
	public void setMember(String mID,String mP,String mm,int nobb,int noob,int nonb,boolean mauthor)
	{
		memberID=mID;
		memberPassword=mP;
		memberemail=mm;
		numberOfBorrowBook=nobb;
		numberOfOverdueBook=noob;
		numberOfNoticeBook=nonb;
		right=mauthor;
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
}
