package librarySystem;

import javafx.scene.Node;

import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import java.awt.BorderLayout;
import java.awt.Color;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.*;
import javax.swing.border.Border;

import javafx.event.ActionEvent;

public class LibrarianController {
	File f;
	@FXML
	private Button addMemberButton;
	@FXML
	private Button addEbookButton;
	@FXML
	private Button addBookButton;
	@FXML
	private Button editMemberButton;
	@FXML
	private Button editEbookButton;
	@FXML
	private Button editBookButton;
	@FXML
	private Button deleteMemberButton;
	@FXML
	private Button deleteEbookButton;
	@FXML
	private Button searchBookButton;
	@FXML
	private Button borrowBookButton;
	@FXML
	private Button returnBookButton;
	@FXML
	private Button updatePaperBookStateButton;

	@FXML
	public void addMemberButtonClick(ActionEvent event) {
		JFrame ADF = new JFrame("addMember");
		JButton b1 = new JButton("creatMember");
		JTextField ID = new JTextField(15);
		JTextField Ipas = new JTextField(15);
		JTextField IMN = new JTextField(15);
		JTextField IMRCNID = new JTextField(10);
		JTextField email = new JTextField(30);
		JPanel p1 = new JPanel();
		p1.add(new JLabel("memberID"));
		p1.add(ID);
		p1.add(new JLabel("memberPassword"));
		p1.add(Ipas);
		p1.add(new JLabel("memberName"));
		p1.add(IMN);
		p1.add(new JLabel("member身分證字號"));
		p1.add(IMRCNID);
		p1.add(new JLabel("memberemail"));
		p1.add(email);
		p1.add(b1);
		ADF.setSize(300, 400);
		ADF.add(p1);
		ADF.setVisible(true);
		b1.addActionListener(ActionEvent -> {
			ArrayList checkR = new ArrayList();
			ArrayList getcheckR = new ArrayList();
			ArrayList getcheckRMRID = new ArrayList();
			int mType = JOptionPane.INFORMATION_MESSAGE;
			int opt = JOptionPane.showConfirmDialog(ADF, "您真的要新增會員嗎？", "提示訊息", JOptionPane.YES_NO_OPTION, mType);
			String CM = ID.getText();
			char beginChar = CM.charAt(0);
			if (beginChar == 'M') {
				if (opt == JOptionPane.YES_OPTION) {
					Member createMember = new Member();
					boolean t = true;
					createMember.setMember(ID.getText(), Ipas.getText(), email.getText(), IMN.getText(),
							IMRCNID.getText(), 0, 0, 0, t);
					ArrayList sendMember = new ArrayList();
					sendMember.add(createMember);
					checkR.add(sendMember);
					try {
						getcheckR = LibraryDBMgr.searchData(createMember.getmemberID(), "member");
					} catch (Exception e) {
					}
					if (getcheckR.isEmpty()) {
						try {
							getcheckRMRID = LibraryDBMgr.searchData(createMember.getmemberID(), "MRID");
						} catch (Exception e) {

						}
						if (getcheckRMRID.isEmpty()) {
							try {
								LibraryDBMgr.addData(sendMember, "member");
								JOptionPane.showMessageDialog(ADF, "成功新增", "訊息", JOptionPane.INFORMATION_MESSAGE);
							} catch (Exception e) {
								JOptionPane.showMessageDialog(ADF, "無法寫入值不能為空", "Error", JOptionPane.ERROR_MESSAGE);
							}
						} else {
							JOptionPane.showMessageDialog(ADF, "身分證字號重複", "Error", JOptionPane.ERROR_MESSAGE);
						}
					} else {
						JOptionPane.showMessageDialog(ADF, "MemberID重複", "Error", JOptionPane.ERROR_MESSAGE);
					}
				} else if (opt == JOptionPane.NO_OPTION) {
					// borrowFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
					JOptionPane.showMessageDialog(ADF, "取消", "訊息", JOptionPane.INFORMATION_MESSAGE);
				}
			} else {
				JOptionPane.showMessageDialog(ADF, "memberID 開頭一定要是大寫M", "Error", JOptionPane.ERROR_MESSAGE);
			}
		});
	}

	@FXML
	public void addEbookButtonClick(ActionEvent event) {
		ArrayList IAEB = new ArrayList();
		JFrame jf = new JFrame("CreateEbook");
		JPanel jp1 = new JPanel();
		JFileChooser chooser = new JFileChooser(".");
		JTextField bookTitle = new JTextField(15);
		JTextField author = new JTextField(15);
		JTextField publisher = new JTextField(30);
		JTextField publicationdate = new JTextField(30);
		JTextArea summary = new JTextArea(5, 40);
		JButton getPath = new JButton("選擇檔案");
		JButton save = new JButton("新增ebook");
		JLabel accessory = new JLabel();
		JLabel label = new JLabel();
		chooser.setAcceptAllFileFilterUsed(false);
		chooser.addPropertyChangeListener(Actionevent -> {
			if (Actionevent.getPropertyName() == JFileChooser.SELECTED_FILE_CHANGED_PROPERTY) {
				f = (File) Actionevent.getNewValue();
				if (f == null) {
					accessory.setIcon(null);
					return;
				}
				String s = new String(f.getPath());
				accessory.setText(s);
			}
		});
		jp1.add(new JLabel("bookTitle："));
		jp1.add(bookTitle);
		jp1.add(new JLabel("author："));
		jp1.add(author);
		jp1.add(new JLabel("publisher："));
		jp1.add(publisher);
		jp1.add(new JLabel("publicationdate："));
		jp1.add(publicationdate);
		jp1.add(new JLabel("summary ："));
		jp1.add(summary);
		jp1.add(getPath);
		jp1.add(label);
		jp1.add(save);
		jf.add(jp1);
		jf.setSize(440, 400);
		// jf.pack();
		jf.setVisible(true);
		save.addActionListener(Actionevent -> {
			int mType = JOptionPane.INFORMATION_MESSAGE;
			int opt = JOptionPane.showConfirmDialog(jf, "您真的要新增Ebook嗎？", "提示訊息", JOptionPane.YES_NO_OPTION, mType);
			if (opt == JOptionPane.YES_OPTION) {
				Ebook storeEbook = new Ebook();
				storeEbook.setEbook(null, bookTitle.getText(), author.getText(), publisher.getText(),
						publicationdate.getText(), summary.getText(), label.getText());
				IAEB.add(storeEbook);
				try {
					LibraryDBMgr.addData(IAEB, "ebook");
				} catch (Exception e) {
					JOptionPane.showMessageDialog(jf, "you have wrong input", "Error", JOptionPane.ERROR_MESSAGE);
				}
				JOptionPane.showMessageDialog(jf, "成功新增ebook的id是" + InitialGUI.getmaxID(), "訊息",
						JOptionPane.INFORMATION_MESSAGE);
			} else if (opt == JOptionPane.NO_OPTION) {
				JOptionPane.showMessageDialog(jf, "取消", "訊息", JOptionPane.INFORMATION_MESSAGE);
			}
		});
		getPath.addActionListener(Actionevent -> {
			int result = chooser.showDialog(jf, "開啟文件檔");
			if (result == JFileChooser.APPROVE_OPTION) {
				String name = f.getName().toLowerCase();
				if (name.endsWith(".txt")) {
					String namep = chooser.getSelectedFile().getPath();
					label.setText(namep);
					System.out.println(label.getText());
				} else {
					JOptionPane.showMessageDialog(jf, "you can set .txt", "Error", JOptionPane.ERROR_MESSAGE);
				}
			}
		});
	}

	@FXML
	public void addBookButtonClick(ActionEvent event) {
		JFrame APBF = new JFrame("addPaperBook");
		JButton creatPaperBook = new JButton("creatPaperBook");
		JTextField bookTitle = new JTextField(20);
		JTextField author = new JTextField(15);
		JTextField publisher = new JTextField(15);
		JTextField publicationDate = new JTextField(15);
		JTextArea summary = new JTextArea(5, 40);
		JTextField price = new JTextField(15);
		JRadioButton avaliableJRB = new JRadioButton("available", true);
		JRadioButton unavaliableJRB = new JRadioButton("unavailable", false);
		JPanel p1 = new JPanel();
		JPanel p2 = new JPanel();
		ButtonGroup bg = new ButtonGroup();
		bg.add(avaliableJRB);
		bg.add(unavaliableJRB);
		Border line = BorderFactory.createLineBorder(Color.black);
		p2.setBorder(BorderFactory.createTitledBorder(line, "books's state"));
		p2.add(avaliableJRB);
		p2.add(unavaliableJRB);
		p1.add(new JLabel("bookTitle："));
		p1.add(bookTitle);
		p1.add(new JLabel("author："));
		p1.add(author);
		p1.add(new JLabel("publisher："));
		p1.add(publisher);
		p1.add(new JLabel("publicationDate："));
		p1.add(publicationDate);
		p1.add(new JLabel("summary："));
		p1.add(summary);
		p1.add(new JLabel("state："));
		p1.add(p2);
		p1.add(new JLabel("price："));
		p1.add(price);
		p1.add(creatPaperBook);
		APBF.setSize(200, 400);
		APBF.add(p1);
		APBF.setVisible(true);
		creatPaperBook.addActionListener(ActionEvent -> {
			int mType = JOptionPane.INFORMATION_MESSAGE;
			int opt = JOptionPane.showConfirmDialog(APBF, "您真的要新增書嗎？", "提示訊息", JOptionPane.YES_NO_OPTION, mType);
			if (opt == JOptionPane.YES_OPTION) {
				PaperBook createPaperBook = new PaperBook();
				int i = Integer.valueOf(price.getText());
				String bookState;
				if (avaliableJRB.isSelected()) {
					bookState = "available";
				} else {
					bookState = "unavailible";
				}
				createPaperBook.setPaperBook(null, bookTitle.getText(), author.getText(), publisher.getText(),
						publicationDate.getText(), summary.getText(), bookState, null, null, i);
				ArrayList sendaddPB = new ArrayList();
				sendaddPB.add(createPaperBook);
				try {
					LibraryDBMgr.addData(sendaddPB, "paperbook");
				} catch (Exception e) {
					JOptionPane.showMessageDialog(APBF, "your input is wrong", "Error", JOptionPane.ERROR_MESSAGE);
				}
				JOptionPane.showMessageDialog(APBF, "成功新增PaperBook ID:" + InitialGUI.getmaxID(), "訊息",
						JOptionPane.INFORMATION_MESSAGE);
			} else if (opt == JOptionPane.NO_OPTION) {
				JOptionPane.showMessageDialog(APBF, "取消", "訊息", JOptionPane.INFORMATION_MESSAGE);
			}
		});
	}

	@FXML
	public void editMemberButtonClick(ActionEvent event) {
		ArrayList<Member> storeMembers = new ArrayList<Member>();
		Member haveMember = new Member();
		JFrame editMemberFrame = new JFrame("修改member介面");
		JPanel p = new JPanel();
		editMemberFrame.setDefaultLookAndFeelDecorated(true);
		String input = JOptionPane.showInputDialog("請輸入memberID");
		if (input != null || input != "") {
			try {
				storeMembers = LibraryDBMgr.searchData(input, "member");
			} catch (Exception e) {
				//
			}
			haveMember = storeMembers.get(0);
			if (haveMember.getmemberID() == null || haveMember.getmemberID() == "") {
				JOptionPane.showMessageDialog(editMemberFrame, "can not find member", "Error",
						JOptionPane.ERROR_MESSAGE);
			} else {

				System.out.print(input + "in");
				JButton b1 = new JButton("修改");
				JTextField ID = new JTextField(haveMember.getmemberID(), 15);
				JTextField memberPassword = new JTextField(haveMember.getmemberPassword(), 15);
				JTextField IMN = new JTextField(haveMember.getmemberName(), 15);
				JTextField IMRCNID = new JTextField(haveMember.memberRepublicofChinaNationalID(), 10);
				JTextField email = new JTextField(haveMember.getmemberemail(), 30);
				String store = Integer.toString(haveMember.getnumberOfBorrowBook());
				JTextField numberOfBorrowBook = new JTextField(store, 15);
				store = Integer.toString(haveMember.getnumberOfOverdueBook());
				JTextField numberOfOverdueBook = new JTextField(store, 15);
				store = Integer.toString(haveMember.getnumberOfNoticeBook());
				JTextField numberOfNoticeBook = new JTextField(store, 15);
				store = String.valueOf(haveMember.getright());
				JTextField memberRight = new JTextField(store, 15);
				p.add(new JLabel("memberID"));
				p.add(ID);
				p.add(new JLabel("memberPassword"));
				p.add(memberPassword);
				p.add(new JLabel("memberName"));
				p.add(IMN);
				p.add(new JLabel("member身分證字號"));
				p.add(IMRCNID);
				p.add(new JLabel("memberemail"));
				p.add(email);
				p.add(new JLabel("numberOfBorrowBook"));
				p.add(numberOfBorrowBook);
				p.add(new JLabel("numberOfOverdueBook"));
				p.add(numberOfOverdueBook);
				p.add(new JLabel("numberOfNoticeBook"));
				p.add(numberOfNoticeBook);
				p.add(new JLabel("memberRight"));
				p.add(memberRight);
				p.add(b1);
				editMemberFrame.add(p);
				editMemberFrame.setSize(400, 250);
				editMemberFrame.setVisible(true);
				b1.addActionListener(ActionEvent -> {
					Member sendMember = new Member();
					int mType = JOptionPane.INFORMATION_MESSAGE;
					int opt = JOptionPane.showConfirmDialog(editMemberFrame, "您真的要修改會員嗎？", "提示訊息",
							JOptionPane.DEFAULT_OPTION, mType);
					if (opt == JOptionPane.YES_OPTION) {
						boolean right;
						if (memberRight.getText().equals("true")) {
							right = true;
						} else {
							right = false;
						}
						sendMember.setMember(ID.getText(), memberPassword.getText(), IMN.getText(), IMRCNID.getText(),
								email.getText(), Integer.valueOf(numberOfBorrowBook.getText()),
								Integer.valueOf(numberOfOverdueBook.getText()),
								Integer.valueOf(numberOfNoticeBook.getText()), right);
						ArrayList putInEdit = new ArrayList();
						putInEdit.add(sendMember);
						LibraryDBMgr.editData(sendMember.getmemberID(), putInEdit, "member");
						JOptionPane.showMessageDialog(editMemberFrame, "成功新增", "訊息", JOptionPane.INFORMATION_MESSAGE);
					} else if (opt == JOptionPane.NO_OPTION) {
						// borrowFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
						JOptionPane.showMessageDialog(editMemberFrame, "取消", "訊息", JOptionPane.INFORMATION_MESSAGE);
					}
				});

			}
		}
	}

	@FXML
	public void editEbookButtonClick(ActionEvent event) {
		ArrayList IAEB = new ArrayList();
		ArrayList<Ebook> getebook = new ArrayList<Ebook>();
		JFrame EDBF = new JFrame("editEbook");
		JPanel jp1 = new JPanel();
		JFileChooser chooser = new JFileChooser(".");
		JButton getPath = new JButton("選擇檔案");
		JButton save = new JButton("修改ebook");
		JLabel accessory = new JLabel();
		JLabel label = new JLabel();
		JLabel labelID = new JLabel();
		chooser.setAcceptAllFileFilterUsed(false);
		EDBF.setDefaultLookAndFeelDecorated(true);
		String input = JOptionPane.showInputDialog("請輸入EbookID");
		if (input != null || input != "") {
			try {
				getebook = LibraryDBMgr.searchData(input, "searchebook");
			} catch (Exception e) {
				System.out.println("無法搜尋");
			}
			Ebook setEbook = new Ebook();
			setEbook = getebook.get(0);
			JTextField bookTitle = new JTextField(setEbook.getbookTitle(), 15);
			JTextField author = new JTextField(setEbook.getauthor(), 15);
			JTextField publisher = new JTextField(setEbook.getpublisher(), 15);
			JTextField publicationdate = new JTextField(setEbook.publicationDate, 30);
			JTextArea summary = new JTextArea(5, 40);
			summary.setText(setEbook.getsummary());
			label.setText(setEbook.getbookContext());
			labelID.setText(setEbook.getbookID());
			jp1.add(new JLabel("bookTitle："));
			jp1.add(bookTitle);
			jp1.add(new JLabel("author："));
			jp1.add(author);
			jp1.add(new JLabel("publisher："));
			jp1.add(publisher);
			jp1.add(new JLabel("publicationdate："));
			jp1.add(publicationdate);
			jp1.add(new JLabel("summary ："));
			jp1.add(summary);
			jp1.add(getPath);
			jp1.add(label);
			jp1.add(save);
			EDBF.add(jp1);
			EDBF.setSize(440, 400);
			EDBF.setVisible(true);
			getPath.addActionListener(Actionevent -> {
				int result = chooser.showDialog(EDBF, "開啟文件檔");
				if (result == JFileChooser.APPROVE_OPTION) {
					String name = f.getName().toLowerCase();
					if (name.endsWith(".txt")) {
						String namep = chooser.getSelectedFile().getPath();
						label.setText(namep);
						System.out.println(label.getText());
					} else {
						JOptionPane.showMessageDialog(EDBF, "you can set .txt", "Error", JOptionPane.ERROR_MESSAGE);
					}
				}
			});
			chooser.addPropertyChangeListener(Actionevent -> {
				if (Actionevent.getPropertyName() == JFileChooser.SELECTED_FILE_CHANGED_PROPERTY) {
					f = (File) Actionevent.getNewValue();
					if (f == null) {
						accessory.setIcon(null);
						return;
					}
					String s = new String(f.getPath());
					accessory.setText(s);
				}
			});
			save.addActionListener(Actionevent -> {
				Member sendMember = new Member();
				int mType = JOptionPane.INFORMATION_MESSAGE;
				int opt = JOptionPane.showConfirmDialog(EDBF, "您真的要修改ebook嗎？", "提示訊息", JOptionPane.DEFAULT_OPTION,
						mType);
				if (opt == JOptionPane.YES_OPTION) {
					Ebook sendEbook = new Ebook();
					sendEbook.setEbook(labelID.getText(), bookTitle.getText(), author.getText(), publisher.getText(),
							publicationdate.getText(), summary.getText(), label.getText());
					ArrayList putInEdit = new ArrayList();
					putInEdit.add(sendEbook);
					LibraryDBMgr.editData(sendEbook.getbookID(), putInEdit, "ebook");
					JOptionPane.showMessageDialog(EDBF, "成功修改", "訊息", JOptionPane.INFORMATION_MESSAGE);
				} else if (opt == JOptionPane.NO_OPTION) {
					// borrowFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
					JOptionPane.showMessageDialog(EDBF, "取消", "訊息", JOptionPane.INFORMATION_MESSAGE);
				}
			});
		}
	}

	@FXML
	public void editBookButtonClick(ActionEvent event) {
		ArrayList getPaperBook = new ArrayList();
		ArrayList<PaperBook> havePaperBook = new ArrayList<PaperBook>();
		JFrame EPBF = new JFrame("editPaperBook");
		JButton editPaperBook = new JButton("editPaperBook");
		JPanel p1 = new JPanel();
		EPBF.setDefaultLookAndFeelDecorated(true);
		String input = JOptionPane.showInputDialog("請輸入PaperbookID");
		if (input != null || input != "") {
			try {
				getPaperBook = LibraryDBMgr.searchData(input, "searchpaperbook");
			} catch (Exception e) {
				System.out.println("無法搜尋");
			}
			if (getPaperBook.isEmpty()) {
				JOptionPane.showMessageDialog(EPBF, "can not find PaperBook", "Error", JOptionPane.ERROR_MESSAGE);
			} else {

				havePaperBook = getPaperBook;
				PaperBook setPaperBook = new PaperBook();
				setPaperBook = havePaperBook.get(0);
				JTextField bookTitle = new JTextField(setPaperBook.getbookTitle(), 20);
				JTextField author = new JTextField(setPaperBook.getauthor(), 15);
				JTextField publisher = new JTextField(setPaperBook.getpublisher(), 15);
				JTextField publicationDate = new JTextField(setPaperBook.getpublisher(), 15);
				JTextArea summary = new JTextArea(5, 40);
				summary.setText(setPaperBook.getsummary());
				JTextField state = new JTextField(setPaperBook.getstate(), 15);
				String showprice = String.valueOf(setPaperBook.getprice());
				JTextField price = new JTextField(showprice, 15);
				JLabel PBL = new JLabel("PaperBookID" + setPaperBook.getbookID());
				p1.add(PBL);
				p1.add(new JLabel("bookTitle："));
				p1.add(bookTitle);
				p1.add(new JLabel("author："));
				p1.add(author);
				p1.add(new JLabel("publisher："));
				p1.add(publisher);
				p1.add(new JLabel("publicationDate："));
				p1.add(publicationDate);
				p1.add(new JLabel("summary："));
				p1.add(summary);
				p1.add(new JLabel("price："));
				p1.add(price);
				p1.add(editPaperBook);
				EPBF.setSize(200, 400);
				EPBF.add(p1);
				EPBF.setVisible(true);
				editPaperBook.addActionListener(ActionEvent -> {
					String paperBookID = PBL.getText();
					int mType = JOptionPane.INFORMATION_MESSAGE;
					int opt = JOptionPane.showConfirmDialog(EPBF, "您真的要修改書嗎？", "提示訊息", JOptionPane.YES_NO_OPTION,
							mType);
					if (opt == JOptionPane.YES_OPTION) {
						PaperBook sendPaperBook = new PaperBook();
						int i = Integer.valueOf(price.getText());
						sendPaperBook.setPaperBook(paperBookID, bookTitle.getText(), author.getText(),
								publisher.getText(), publicationDate.getText(), summary.getText(), state.getText(),
								null, null, i);
						ArrayList sendEditPB = new ArrayList();
						sendEditPB.add(sendPaperBook);
						LibraryDBMgr.editData(paperBookID, sendEditPB, "paperbook");
						JOptionPane.showMessageDialog(EPBF, "成功新增PaperBook ID:" + InitialGUI.getmaxID(), "訊息",
								JOptionPane.INFORMATION_MESSAGE);
					} else if (opt == JOptionPane.NO_OPTION) {
						JOptionPane.showMessageDialog(EPBF, "取消", "訊息", JOptionPane.INFORMATION_MESSAGE);
					}
				});
			}
		}

	}

	@FXML
	public void deleteMemberButtonClick(ActionEvent event) {
		JFrame deleteMFrame = new JFrame("刪除member介面");
		JButton b1 = new JButton("刪除");
		JTextField ID = new JTextField(15);
		JPanel p = new JPanel();
		p.add(new JLabel("輸入要刪除member的ID"));
		p.add(ID);
		p.add(b1);
		deleteMFrame.add(p);
		deleteMFrame.pack();
		deleteMFrame.setVisible(true);
		b1.addActionListener(ActionEvent -> {

			int mType = JOptionPane.INFORMATION_MESSAGE;
			int opt = JOptionPane.showConfirmDialog(deleteMFrame, "您真的要刪除會員嗎？", "提示訊息", JOptionPane.YES_NO_OPTION,
					mType);
			if (opt == JOptionPane.YES_OPTION) {
				ArrayList<Member> getMember = new ArrayList<Member>();
				Member checkMember = new Member();
				try {
					getMember = LibraryDBMgr.searchData(ID.getText(), "member");
				} catch (Exception e) {
				}
				checkMember = getMember.get(0);
				if (checkMember.getnumberOfBorrowBook() != 0 || checkMember.getnumberOfNoticeBook() != 0
						|| checkMember.getnumberOfOverdueBook() != 0) {

					JOptionPane.showMessageDialog(deleteMFrame, "user have borrowing book can't not delete member",
							"Error", JOptionPane.ERROR_MESSAGE);
				} else {
					LibraryDBMgr.deleteData(ID.getText(), "member");
					JOptionPane.showMessageDialog(deleteMFrame, "成功刪除會員", "訊息", JOptionPane.INFORMATION_MESSAGE);
				}
			} else if (opt == JOptionPane.NO_OPTION) {
				// borrowFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
				JOptionPane.showMessageDialog(deleteMFrame, "取消", "訊息", JOptionPane.INFORMATION_MESSAGE);
			}

		});
	}

	@FXML
	public void deleteEbookButtonClick(ActionEvent event) {
		JFrame deleteMFrame = new JFrame("刪除ebook介面");
		JButton b1 = new JButton("刪除");
		JTextField ID = new JTextField(15);
		JPanel p = new JPanel();
		p.add(new JLabel("輸入要刪除ebook的ID"));
		p.add(ID);
		p.add(b1);
		deleteMFrame.add(p);
		deleteMFrame.pack();
		deleteMFrame.setVisible(true);
		b1.addActionListener(ActionEvent -> {
			int mType = JOptionPane.INFORMATION_MESSAGE;
			int opt = JOptionPane.showConfirmDialog(deleteMFrame, "您真的要刪除Ebook嗎？", "提示訊息", JOptionPane.YES_NO_OPTION,
					mType);
			if (opt == JOptionPane.YES_OPTION) {
				ArrayList<Ebook> getEbook = new ArrayList<Ebook>();
				Ebook checkEbook = new Ebook();
				try {
					getEbook = LibraryDBMgr.searchData(ID.getText(), "searchebook");
				} catch (Exception e) {
				}
				checkEbook = getEbook.get(0);
				if (checkEbook != null) {
					LibraryDBMgr.deleteData(ID.getText(), "ebook");
					JOptionPane.showMessageDialog(deleteMFrame, "成功刪除ebook", "訊息", JOptionPane.INFORMATION_MESSAGE);
				} else {
					JOptionPane.showMessageDialog(deleteMFrame, "can not find ebook", "Error",
							JOptionPane.ERROR_MESSAGE);
				}
			} else if (opt == JOptionPane.NO_OPTION) {
				// borrowFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
				JOptionPane.showMessageDialog(deleteMFrame, "取消", "訊息", JOptionPane.INFORMATION_MESSAGE);
			}

		});
	}

	@FXML
	public void searchBookButtonClick(ActionEvent event) {
		Search.main(null);
	}

	@FXML
	public void borrowBookButtonClick(ActionEvent event) {
		JFrame borrowFrame = new JFrame("借書介面");
		JButton b1 = new JButton("借書");
		JTextField ID = new JTextField(15);
		JPanel p = new JPanel();
		p.add(new JLabel("輸入書的ID"));
		p.add(ID);
		p.add(b1);
		borrowFrame.add(p);
		borrowFrame.pack();
		borrowFrame.setDefaultLookAndFeelDecorated(true);
		String input = JOptionPane.showInputDialog("請輸入borrowerID");
		if (input == "" || input == null) {
			System.out.print(input + "fff");
			// borrowFrame.setDefaultCloseOperation(borrowFrame.EXIT_ON_CLOSE);
			// borrowFrame.setVisible(false);
			borrowFrame.dispose();
		} else {
			borrowFrame.setVisible(true);
			b1.addActionListener(ActionEvent -> {
				ArrayList<Member> storeMember = new ArrayList<Member>();
				Member checkMember = new Member();
				String table = new String("searchpaperbook");
				try {
					storeMember = LibraryDBMgr.searchData(input, "member");
					checkMember = storeMember.get(0);
					ArrayList<PaperBook> storePaperBook = new ArrayList<PaperBook>();
					PaperBook checkPaperBook = new PaperBook();
					storePaperBook = LibraryDBMgr.searchData(ID.getText(), table);
					checkPaperBook = storePaperBook.get(0);
					if (checkPaperBook == null) {
						System.out.println("dddd");
						JOptionPane.showMessageDialog(borrowFrame, "can not find bookID", "Error",
								JOptionPane.ERROR_MESSAGE);
					} else {
						System.out.println(checkPaperBook.getstate());
						if (checkPaperBook.getstate().equals("available")) {
							System.out.println("進入借書訊息");
							if (checkMember.getright() == true) {
								System.out.println("進入確認RIGHT");
								int mType = JOptionPane.INFORMATION_MESSAGE;
								int opt = JOptionPane.showConfirmDialog(borrowFrame, "您真的要借書嗎？", "提示訊息",
										JOptionPane.DEFAULT_OPTION, mType);
								if (opt == JOptionPane.YES_OPTION) {
									Date now = new Date();
									SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									String sGMT = sf.format(now);
									checkPaperBook.setbookState("borrowed");
									checkPaperBook.setBorrower(checkMember.getmemberID());
									checkPaperBook.setBorrowerTime(sGMT);
									ArrayList editpb = new ArrayList();
									editpb.add(checkPaperBook);
									String f = "paperbook";
									String editID = checkPaperBook.getbookID();
									LibraryDBMgr.editData(editID, editpb, f);
									int x = checkMember.getnumberOfBorrowBook() + 1;
									checkMember.setnumberOfBorrowBook(x);
									ArrayList editm = new ArrayList();
									editm.add(checkMember);
									LibraryDBMgr.editData(checkMember.getmemberID(), editm, "member");
									JOptionPane.showMessageDialog(borrowFrame, "成功借書", "訊息",
											JOptionPane.INFORMATION_MESSAGE);
								} else if (opt == JOptionPane.NO_OPTION) {
									// borrowFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
									borrowFrame.dispose();
								}
							} else {
								JOptionPane.showMessageDialog(borrowFrame, "you right is closed", "Error",
										JOptionPane.ERROR_MESSAGE);
								// borrowFrame.setDefaultCloseOperation(borrowFrame.EXIT_ON_CLOSE);
								borrowFrame.dispose();
							}
						} else {
							JOptionPane.showMessageDialog(borrowFrame, "Book can not be borrowed", "Error",
									JOptionPane.ERROR_MESSAGE);
						}
					}
				} catch (Exception e) {

				}
			});
		}
	}

	@FXML
	public void returnBookButtonClick(ActionEvent event) {

		JFrame returnBookFrame = new JFrame("還書介面");
		JButton b1 = new JButton("還書");
		JTextField ID = new JTextField(15);
		JPanel p = new JPanel();
		p.add(new JLabel("輸入要還書的ID"));
		p.add(ID);
		p.add(b1);
		returnBookFrame.add(p);
		returnBookFrame.pack();
		returnBookFrame.setVisible(true);
		b1.addActionListener(ActionEvent -> {
			ArrayList getPaperBook = new ArrayList();
			ArrayList sendPaperBook = new ArrayList();
			ArrayList getMember = new ArrayList();
			ArrayList putInEdit = new ArrayList();
			ArrayList<PaperBook> havePaperBook = new ArrayList<PaperBook>();
			ArrayList<Member> haveMember = new ArrayList<Member>();
			PaperBook setPaperBook = new PaperBook();
			Member changeMemberData = new Member();
			try {
				getPaperBook = LibraryDBMgr.searchData(ID.getText(), "searchpaperbook");
				havePaperBook = getPaperBook;
				setPaperBook = havePaperBook.get(0);
			} catch (Exception e) {
				JOptionPane.showMessageDialog(returnBookFrame, "search can not use", "Error",
						JOptionPane.ERROR_MESSAGE);
			}
			if (setPaperBook.getstate().equals("borrowed")) {
				try {
					getMember = LibraryDBMgr.searchData(setPaperBook.getborrower(), "member");
				} catch (Exception e) {
					JOptionPane.showMessageDialog(returnBookFrame, "search can not use", "Error",
							JOptionPane.ERROR_MESSAGE);
				}
				haveMember = getMember;
				changeMemberData = haveMember.get(0);
				int RNOBB = changeMemberData.getnumberOfBorrowBook() - 1;
				changeMemberData.setnumberOfBorrowBook(RNOBB);
				putInEdit.add(changeMemberData);
				LibraryDBMgr.editData(changeMemberData.getmemberID(), putInEdit, "member");
				setPaperBook.setbookState("available");
				setPaperBook.setBorrower(null);
				setPaperBook.setBorrowerTime(null);
				sendPaperBook.add(setPaperBook);
				LibraryDBMgr.editData(setPaperBook.getbookID(), sendPaperBook, "paperbook");
				JOptionPane.showMessageDialog(returnBookFrame, "成功還書", "訊息", JOptionPane.INFORMATION_MESSAGE);

			} else if (setPaperBook.getstate().equals("notice")) {
				try {
					getMember = LibraryDBMgr.searchData(setPaperBook.getborrower(), "member");
				} catch (Exception e) {
					JOptionPane.showMessageDialog(returnBookFrame, "search can not use", "Error",
							JOptionPane.ERROR_MESSAGE);
				}
				haveMember = getMember;
				changeMemberData = haveMember.get(0);
				int RNONB = changeMemberData.getnumberOfNoticeBook() - 1;
				changeMemberData.setnumberOfNoticeBook(RNONB);
				putInEdit.add(changeMemberData);
				LibraryDBMgr.editData(changeMemberData.getmemberID(), putInEdit, "member");
				setPaperBook.setbookState("available");
				setPaperBook.setBorrower(null);
				setPaperBook.setBorrowerTime(null);
				sendPaperBook.add(setPaperBook);
				LibraryDBMgr.editData(setPaperBook.getbookID(), sendPaperBook, "paperbook");
				JOptionPane.showMessageDialog(returnBookFrame, "成功還書", "訊息", JOptionPane.INFORMATION_MESSAGE);
			} else if (setPaperBook.getstate().equals("overdue")) {
				try {
					getMember = LibraryDBMgr.searchData(setPaperBook.getborrower(), "member");
				} catch (Exception e) {
					JOptionPane.showMessageDialog(returnBookFrame, "search can not use", "Error",
							JOptionPane.ERROR_MESSAGE);
				}
				haveMember = getMember;
				changeMemberData = haveMember.get(0);
				int RNOVB = changeMemberData.getnumberOfOverdueBook() - 1;
				if (RNOVB == 0) {
					changeMemberData.setright(true);
				}
				changeMemberData.setnumberOfOverdueBook(RNOVB);
				putInEdit.add(changeMemberData);
				LibraryDBMgr.editData(changeMemberData.getmemberID(), putInEdit, "member");
				setPaperBook.setbookState("available");
				setPaperBook.setBorrower(null);
				setPaperBook.setBorrowerTime(null);
				sendPaperBook.add(setPaperBook);
				LibraryDBMgr.editData(setPaperBook.getbookID(), sendPaperBook, "paperbook");
				JOptionPane.showMessageDialog(returnBookFrame, "成功還書", "訊息", JOptionPane.INFORMATION_MESSAGE);
			} else {
				JOptionPane.showMessageDialog(returnBookFrame, "book can not be return", "Error",
						JOptionPane.ERROR_MESSAGE);
			}
		});
	}

	@FXML
	public void updatePaperBookStateButtonClick(ActionEvent event) {
		ArrayList getPaperBook = new ArrayList();
		ArrayList<PaperBook> havePaperBook = new ArrayList<PaperBook>();
		JRadioButton avaliableJRB = new JRadioButton("available", false);
		JRadioButton unavaliableJRB = new JRadioButton("unavailable", false);
		JRadioButton missingJRB = new JRadioButton("Missing", false);
		JRadioButton damagedJRB = new JRadioButton("Damaged", false);
		JRadioButton deregisterJRB = new JRadioButton("Deregister", false);
		JRadioButton beingRepairedJRB = new JRadioButton("Being Repaired", false);
		JFrame updatePaperBookStateFrame = new JFrame("改變書狀態介面");
		JButton b1 = new JButton("改書狀態");
		JPanel p = new JPanel();
		ButtonGroup bg = new ButtonGroup();
		JPanel p2 = new JPanel();
		Border line = BorderFactory.createLineBorder(Color.black);
		p2.setSize(100, 100);
		p2.setBorder(BorderFactory.createTitledBorder(line, "change books's state"));
		updatePaperBookStateFrame.add(p);
		updatePaperBookStateFrame.pack();
		updatePaperBookStateFrame.setDefaultLookAndFeelDecorated(true);
		String input = JOptionPane.showInputDialog("請輸入PaperbookID");
		if (input != null || input != "") {
			try {
				getPaperBook = LibraryDBMgr.searchData(input, "searchpaperbook");
			} catch (Exception e) {
				System.out.println("無法搜尋");
			}
			if (getPaperBook.isEmpty()) {
				JOptionPane.showMessageDialog(updatePaperBookStateFrame, "can not find PaperBook", "Error",
						JOptionPane.ERROR_MESSAGE);
			} else {
				PaperBook setPaperBook;
				havePaperBook = getPaperBook;
				setPaperBook = havePaperBook.get(0);
				p.add(new JLabel("書的ID是" + setPaperBook.getbookID()));
				p.add(new JLabel("書的狀態是" + setPaperBook.getstate()));
				if (setPaperBook.getstate().equals("damaged")) {
					bg.add(beingRepairedJRB);
					bg.add(deregisterJRB);
					p2.add(beingRepairedJRB);
					p2.add(deregisterJRB);
					p2.add(new JLabel("   "));
					p.add(p2);
					p.add(b1);
					updatePaperBookStateFrame.add(p);
					updatePaperBookStateFrame.pack();
					updatePaperBookStateFrame.setVisible(true);
				} else if (setPaperBook.getstate().equals("borrowed") || setPaperBook.getstate().equals("overdue")
						|| setPaperBook.getstate().equals("notice")) {
					bg.add(missingJRB);
					p2.add(missingJRB);
					p2.add(new JLabel("   "));
					p.add(p2);
					p.add(b1);
					updatePaperBookStateFrame.add(p);
					updatePaperBookStateFrame.pack();
					updatePaperBookStateFrame.setVisible(true);
				} else {
					bg.add(avaliableJRB);
					bg.add(unavaliableJRB);
					bg.add(damagedJRB);
					p2.add(avaliableJRB);
					p2.add(unavaliableJRB);
					p2.add(damagedJRB);
					p.add(p2);
					p.add(b1);
					updatePaperBookStateFrame.add(p);
					updatePaperBookStateFrame.pack();
					updatePaperBookStateFrame.setVisible(true);
				}
				b1.addActionListener(ActionEvent -> {
					String bookState = null;
					if (avaliableJRB.isSelected()) {
						bookState = "available";
					} else if (unavaliableJRB.isSelected()) {
						bookState = "unavaliable";
					} else if (missingJRB.isSelected()) {
						bookState = "missing";
					} else if (damagedJRB.isSelected()) {
						bookState = "damaged";
					} else if (deregisterJRB.isSelected()) {
						bookState = "deregister";
					} else if (beingRepairedJRB.isSelected()) {
						bookState = "beingRepaired";
					}
					setPaperBook.setbookState(bookState);
					ArrayList sendeditPaperBook = new ArrayList();
					sendeditPaperBook.add(setPaperBook);
					LibraryDBMgr.editData(setPaperBook.getbookID(), sendeditPaperBook, "paperbook");
					JOptionPane.showMessageDialog(updatePaperBookStateFrame, "成功:" + InitialGUI.getmaxID(), "訊息",
							JOptionPane.INFORMATION_MESSAGE);
				});
			}
		} else {
			JOptionPane.showMessageDialog(updatePaperBookStateFrame, "don't have input", "Error",
					JOptionPane.ERROR_MESSAGE);
		}
	}
}
