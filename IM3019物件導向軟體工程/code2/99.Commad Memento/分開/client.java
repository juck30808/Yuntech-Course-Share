package Memento_Command;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class client extends JFrame{
	private JTextArea theText = new JTextArea(40,60);
	private JButton saveBut, undoBut, redoBut;
	public Invoker invoker = new Invoker();
	public Command command;
	public originator orig;
	public Receiver re;
	int saveFiles = 0, current = 0;
	
	public static void main(String[] args) {
		client c = new client();
	}

	public client() {
		orig = new originator();  //©ñ¤Jªì©l­È
		orig.setText("");
		re = new Receiver(orig);
		
		this.setSize(1100,780);
		this.setTitle("Memento test");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel panel1 = new JPanel();
		
		panel1.add(new JLabel("Text"));
		panel1.add(theText);
		
		ButtonListener saveListener = new ButtonListener();
		ButtonListener undoListener = new ButtonListener();
		ButtonListener redoListener = new ButtonListener();
		
		saveBut = new JButton("save");
		saveBut.addActionListener(saveListener);
		
		undoBut = new JButton("undo");
		undoBut.addActionListener(undoListener);
		
		redoBut = new JButton("redo");
		redoBut.addActionListener(redoListener);
		
		panel1.add(saveBut);
		panel1.add(undoBut);
		panel1.add(redoBut);
		
		this.add(panel1);
		this.setVisible(true);
		
	}
	class ButtonListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e) {
			System.out.println("e.getSource() = " + e.getActionCommand());
			
			if(e.getSource() == saveBut) {
				String text = theText.getText();
				
				command = new SaveCommand(re);
				invoker.setCommand(command);
				invoker.setText(text);
				invoker.run();
				
				saveFiles++;
				current++;
				System.out.println("Save Files " + saveFiles);
				
				undoBut.setEnabled(true);
			}
			else if (e.getSource() == undoBut) {
				if(current >= 1) {
					current--;
					
					command = new UndoCommand(re);
					invoker.setCommand(command);
					invoker.setCurrentNumber(current);
					String text = invoker.run();
					
					theText.setText(text);
					redoBut.setEnabled(true);
				}
				else {
					undoBut.setEnabled(false);
				}
			}
			else if (e.getSource() == redoBut) {
				if(saveFiles > current) {
					current++;
					
					command = new RedoCommand(re);
					invoker.setCommand(command);
					invoker.setCurrentNumber(current);
					String text = invoker.run();
					
					theText.setText(text);
					undoBut.setEnabled(true);
				}
				else {
					redoBut.setEnabled(false);
				}
			}
		}
		
	}
}
