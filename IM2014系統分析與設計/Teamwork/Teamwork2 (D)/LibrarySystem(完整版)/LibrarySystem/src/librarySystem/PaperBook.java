package librarySystem;
import java.util.Date;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
public class PaperBook extends book{
			private String state;
			private String borrower;
			private int price;
			private String borrowerTime;
			public void view()
		{
				JFrame viewPaperBook=new JFrame("viewPaperBook");
				JPanel jp1 = new JPanel();
				JTextArea summary = new JTextArea(5,40);
				JButton readEbook=new JButton("ÂsÄýEbook¤º®e");
				jp1.add(new JLabel("bookTitle¡G"));
				jp1.add(new JLabel(this.getbookTitle()));
				jp1.add(new JLabel("book's state¡G"));
				jp1.add(new JLabel(this.getstate()));
				jp1.add(new JLabel("author¡G"));
				jp1.add(new JLabel(this.getauthor()));
				jp1.add(new JLabel("publisher¡G"));
				jp1.add(new JLabel(this.getpublisher()));
				jp1.add(new JLabel("publicationdate¡G"));
				jp1.add(new JLabel(this.getpublicationDate()));
				jp1.add(new JLabel("summary :"));
				summary.setText(this.getsummary());;
				jp1.add(summary);
				viewPaperBook.setSize(400,400);
				viewPaperBook.add(jp1);
				viewPaperBook.setVisible(true);
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
			String IborrowerTime,
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
			super.bookType="paperbook";
		}
		public void setbookState(String i) 
		{
			state=i;
		}
		public void setBorrower(String i) 
		{
			borrower=i;
		}
		public void setBorrowerTime(String i) 
		{
			borrowerTime=i;
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
		public String getborrowerTime() 
		{
			return borrowerTime;
		}
		public String getbookType()
		{
			return (super.bookType);
		}
}
