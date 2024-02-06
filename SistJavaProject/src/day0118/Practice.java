package day0118;

import java.awt.Color;
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class Practice extends JFrame{
	Container cp;
	JLabel lb1, lb2, lbResult;
	JTextField tf1, tf2;
	JButton bt1, bt2, bt3, bt4;
	
	public Practice() {
		this.setTitle("텍스트 필드 문제");
		
		cp=this.getContentPane();
		this.setBounds(500, 100, 300, 300);
		cp.setBackground(new Color(255, 200, 200));
		setDesign();
		this.setVisible(true);
	}
	public void setDesign() {
		this.setLayout(null);
		
		lb1=new JLabel("숫자1", JLabel.CENTER	);
		lb1.setBackground(Color.orange);
		lb1.setBounds(20, 20, 50, 30);
		this.add(lb1);
		lb2=new JLabel("숫자2", JLabel.CENTER);
		lb2.setBackground(Color.orange);
		lb2.setBounds(20, 70, 50, 30);
		this.add(lb2);
	
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Practice();
	}

}
