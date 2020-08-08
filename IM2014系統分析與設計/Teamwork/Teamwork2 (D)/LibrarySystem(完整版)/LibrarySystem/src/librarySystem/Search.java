package librarySystem;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import java.awt.*;
import java.util.ArrayList; 
public class Search extends javax.swing.JFrame {

   
    public Search() {
        initComponents();
    }
    @SuppressWarnings("unchecked")                        
    private void initComponents() {
    	
        jScrollPane2 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jLabel1 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jTextField1 = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jButton2 = new javax.swing.JButton();
        //jButton3 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane2.setViewportView(jTextArea1);
        String col[] = {"Pos","Team","P", "W"};
        DefaultTableModel model = new DefaultTableModel(col, 0);
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        JTable jTable1 = new JTable(model);
        jLabel1.setText("搜尋書介面");
        jButton1.setText("搜尋書");
        jTextField1.setColumns(10);
        jLabel2.setText("搜尋書關鍵字");
        jButton2.setText("看書詳細資料");
        //jButton3.setText("離開");
        ArrayList<book> combin = new ArrayList<book>();
        jTable1.setModel(model);
        jButton1.addActionListener(Actionevent->{
        	ArrayList<PaperBook> getPaperBook = new ArrayList<PaperBook>();
        	ArrayList<Ebook> getEBook = new ArrayList<Ebook>();
        	model.setRowCount(0);
        	try {
        	getPaperBook=LibraryDBMgr.searchData(jTextField1.getText(),"searchpkeyword");
        	}catch(Exception e)
        	{}
        	try {
        	getEBook=LibraryDBMgr.searchData(jTextField1.getText(),"searchekeyword");
        	}catch(Exception e)
        	{}
        	combin.addAll(getPaperBook);
        	combin.addAll(getEBook);
        	for (int i = 0; i < combin.size(); i++){
        		   String bookTitle = combin.get(i).bookTitle;
        		   String author = combin.get(i).author;
        		   String publisher = combin.get(i).publisher;
        		   String publicationDate = combin.get(i).publicationDate;
        		   Object[] data = {bookTitle, author, publisher, publicationDate};
        		   model.addRow(data);
        		}
        	System.out.print(combin.toString());
        	jScrollPane1.setViewportView(jTable1);
        });
        jButton2.addActionListener(Actionevent->{
        	  int row=jTable1.getSelectedRow(); 
        	  book selectbook = combin.get(row);
    	      selectbook.view();
        });
        jScrollPane1.setViewportView(jTable1);
        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(68, 68, 68)
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 104, Short.MAX_VALUE)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(130, 130, 130)
                        .addComponent(jButton1)
                        .addGap(79, 79, 79))
                    .addComponent(jScrollPane1)))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                //.addGap(49, 49, 49)
                //.addComponent(jButton3)
                .addGap(186, 186, 186)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButton2)
                .addGap(52, 52, 52))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jButton1)
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 341, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 47, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton2)
                    //.addComponent(jButton3)
                    )
                .addGap(27, 27, 27))
        );

        pack();
    }                        
                                          

    public static void main(String args[]) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Search.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Search.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Search.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Search.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Search().setVisible(true);
            }
        });
    }
    
    
                 
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    //private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JTextField jTextField1;               
}
