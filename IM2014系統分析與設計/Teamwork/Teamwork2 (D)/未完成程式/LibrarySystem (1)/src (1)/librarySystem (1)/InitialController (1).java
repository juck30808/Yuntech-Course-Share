package librarySystem;

import java.util.ArrayList;
import java.awt.*;

public class InitialController {
	public static void checkUser(String ID,String password)
	{
		ArrayList<Librarian> storeLibrarian=new ArrayList<Librarian>();
		ArrayList<Member> storeMember=new ArrayList<Member>();
		Librarian checkLibrairanClass = new Librarian();
		Member checkMember = new Member();
		try
		{
		char beginChar=ID.charAt(0);
		if(beginChar=='L')
		{
			String table= new String("librarian");
			storeLibrarian=LibraryDBMgr.searchData(ID,table);
			checkLibrairanClass=storeLibrarian.get(0);
			if(password.equals(checkLibrairanClass.getlibrarianPassword()))
			{
				System.out.println("成功登入");
			}
			else if(checkLibrairanClass.getlibrarianPassword() == null)
			{
				System.out.println("無此管理員");
			}
			else
			{
				System.out.println("登入失敗");
			}
		}
		else if(beginChar=='M')
		{
			String table= new String("member");
			storeMember=LibraryDBMgr.searchData(ID,table);
			checkMember=storeMember.get(0);
			if(password.equals(checkMember.getmemberPassword()))
			{
				System.out.println("成功登入");
			}
			else if(checkMember.getmemberPassword() == null)
			{
				System.out.println("無此管理員");
			}
			else
			{
				System.out.println("登入失敗");
			}
		}
		}
		catch(Exception e)
		{
			System.out.println("未成功搜尋");
		}
	}
}
