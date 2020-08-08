package librarySystem;
import javax.swing.*;
import javax.swing.text.DefaultCaret;

import java.awt.Toolkit;
import java.io.*;
public class Ebook extends book{
	private String bookContext;
	public void view()
	{
		JFrame view=new JFrame("viewEbook");
		JPanel jp1 = new JPanel();
		JTextArea summary = new JTextArea(5,40);
		JButton readEbook=new JButton("瀏覽Ebook內容");
		jp1.add(new JLabel("bookTitle："));
		jp1.add(new JLabel(this.getbookTitle()));
		jp1.add(new JLabel("author："));
		jp1.add(new JLabel(this.getauthor()));
		jp1.add(new JLabel("publisher："));
		jp1.add(new JLabel(this.getpublisher()));
		jp1.add(new JLabel("publicationdate："));
		jp1.add(new JLabel(this.getpublicationDate()));
		jp1.add(new JLabel("summary :"));
		summary.setText(this.getsummary());;
		if(InitialGUI.getloginMember()!=null)
		{
			jp1.add(readEbook);
		}
		jp1.add(summary);
		view.setSize(400,400);
		view.add(jp1);
		view.setVisible(true);
		readEbook.addActionListener(Actionevent ->{
			JFrame readEbookF=new JFrame("viewEbook");
			JPanel readEbookP = new JPanel();
			JTextArea contain = new JTextArea();
			JScrollPane scroll=new JScrollPane(contain);
			scroll.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
			scroll.setSize(Toolkit.getDefaultToolkit().getScreenSize()); 
			try
			{
				FileReader fr=new FileReader(this.getbookContext());
				BufferedReader br=new BufferedReader(fr);
				String lineSeparator = System.getProperty("line.separator");
				String line;
				while ((line=br.readLine()) != null) {
					contain .append(line);
					contain .append(lineSeparator);
					  }
			}catch(Exception e)
			{
				System.out.println("無法讀取");
			}
			
			//contain.setCaretPosition(contain.getDocument().getLength());
			//readEbookP.add(contain);
			readEbookF.add(scroll);
			readEbookF.add(readEbookP);
			readEbookF.pack();
			readEbookF.setExtendedState(readEbookF.MAXIMIZED_BOTH);
			readEbookF.setVisible(true);
		});
	}
	public void setEbook(
	String IbookID,
	String IbookTitle,
	String Iaurhor,
	String Ipublisher,
	String IpublicationDate,
	String Isummary,
	String IbookContext
	)
	{
		super.bookID=IbookID;
		super.bookTitle=IbookTitle;
		super.author=Iaurhor;
		super.publisher=Ipublisher;
		super.publicationDate=IpublicationDate;
		super.summary=Isummary;
		bookContext=IbookContext;
		super.bookType="ebook";
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
	public String getbookContext() 
	{
		System.out.println(bookContext);
		return bookContext;
	}
	public String getbookType()
	{
		return (super.bookType);
	}
}
