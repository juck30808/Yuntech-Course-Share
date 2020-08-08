package librarySystem;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.TimerTask;  
public class CheckOverdueBook extends TimerTask{
    public void run() {  
    	System.out.println("¨Ï¥Î");
       ArrayList getCheckBook =new ArrayList();
       java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");  
       long day = 0;
       Date now =new Date();
       try {
       getCheckBook=LibraryDBMgr.searchData(null, "CheckOverdueBook");
       }catch(Exception e)
       {}
       ArrayList<PaperBook> PBA =new ArrayList<PaperBook>();
       PBA=getCheckBook;
       for (int i = 0; i < getCheckBook.size(); i++)
       {
    	   
    	   PaperBook store = new PaperBook();
    	   store=PBA.get(i);
	       String borrowTimeString = store.getborrowerTime();
	       try
	       {
	    	   java.util.Date beginDate = format.parse(borrowTimeString);
	    	   day=(beginDate.getTime() - now.getTime())/(24*60*60*1000);  
	    	   System.out.println(day);
	       }catch(Exception e)
	       {
	    	   System.out.println(e);
	       }
	       if(day>=0 && day<3)
	       {
	    	   System.out.println("day<=3");
	    	   ArrayList getMSearch =new ArrayList();
	    	   ArrayList<Member> haveM =new ArrayList<Member>();
	    	   ArrayList SEP =new ArrayList();
	    	   ArrayList SEM =new ArrayList();
	    	   ArrayList<Member> OMAL =new ArrayList<Member>();
	    	   Member OM = new Member();
	    	   store=PBA.get(i);
	    	   store.setbookState("notice");
	    	   try
	    	   {
	    	   getMSearch=LibraryDBMgr.searchData(store.getborrower(),"member");
	    	   }catch(Exception e)
	    	   {}
	    	   haveM=getMSearch;
	    	   OM=haveM.get(0);
	    	   OM.setnumberOfBorrowBook(OM.getnumberOfBorrowBook()-1);
	    	   OM.setnumberOfNoticeBook(OM.getnumberOfNoticeBook()+1);
	    	   SEP.add(store);
	    	   SEM.add(OM);
	    	   LibraryDBMgr.editData(store.getbookID(),SEP,"paperbook");
	    	   LibraryDBMgr.editData(OM.getmemberID(),SEM,"member");
	       }
	       else if(day<0)
	       {
	    	   System.out.println("day<=0");
	    	   ArrayList getMSearch =new ArrayList();
	    	   ArrayList<Member> haveM =new ArrayList<Member>();
	    	   ArrayList SEP =new ArrayList();
	    	   ArrayList SEM =new ArrayList();
	    	   ArrayList<Member> OMAL =new ArrayList<Member>();
	    	   store=PBA.get(i);
	    	   Member OM = new Member();
	    	   store.setbookState("overdue");
	    	   try
	    	   {
	    	   getMSearch=LibraryDBMgr.searchData(store.getborrower(),"member");
	    	   }catch(Exception e)
	    	   {}
	    	   haveM=getMSearch;
	    	   OM=haveM.get(0);
	    	   OM.setnumberOfNoticeBook(OM.getnumberOfNoticeBook()-1);
	    	   OM.setnumberOfOverdueBook(OM.getnumberOfOverdueBook()+1);
	    	   OM.setright(false);
	    	   SEP.add(store);
	    	   SEM.add(OM);
	    	   LibraryDBMgr.editData(store.getbookID(),SEP,"paperbook");
	    	   LibraryDBMgr.editData(OM.getmemberID(),SEM,"member");
	       }
       }
       ArrayList getOMA =new ArrayList();
       ArrayList<Member> getOM =new ArrayList<Member>();
       try {
    	   getOMA=LibraryDBMgr.searchData(null, "GOM");
           }catch(Exception e)
       		{}
       getOM=getOMA;
       for (int i = 0; i < getOM.size(); i++)
       {
    	   Member sendNoticeEmail = new Member();
    	   sendNoticeEmail=getOM.get(i);
    	   SendEmail.send(sendNoticeEmail);
       }
    }
}
