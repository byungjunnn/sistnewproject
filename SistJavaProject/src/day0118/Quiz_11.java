package day0118;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.plaf.FontUIResource;

public class Quiz_11 extends JFrame implements ActionListener{
	Container cp;
	JLabel lbl;
	JButton[] btn=new JButton[5];
	String[] btnLabel= {"Red","Orange","Yellow","Green","Blue"};
	Color[] btnColor= {Color.RED, Color.ORANGE, Color.YELLOW, Color.GREEN, Color.BLUE};
	
	public Quiz_11() {
		super("계산 연습문제");
		
		cp=this.getContentPane();
		
		this.setBounds(800, 100, 600, 300);
		cp.setBackground(new Color(255,255,200));
		setDesign();
		this.setVisible(true);
	}
	public void setDesign() {
		JPanel panel=new JPanel();
		panel.setBackground(Color.black);
		this.add(panel, BorderLayout.NORTH);
		
		for(int i=0;i<btn.length;i++) {
			btn[i]=new JButton(btnLabel[i]);
			btn[i].setBackground(btnColor[i]);
			btn[i].setForeground(Color.WHITE);
			btn[i].addActionListener(this);
			panel.add(btn[i]);
		}
		lbl=new JLabel("안녕하세요", JLabel.CENTER);
		lbl.setFont(new FontUIResource("", Font.BOLD, 30));
		this.add(lbl);
		
		//익명내부클래스로 하나씩 실행가능
//		btn[0].addActionListener(new ActionListener() {
//			
//			@Override
//			public void actionPerformed(ActionEvent e) {
//				// TODO Auto-generated method stub
//				
//			}
//		});
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob=e.getSource();
		for(int i=0;i<btn.length;i++) {
			if(ob==btn[i])
				lbl.setForeground(btnColor[i]);
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new Quiz_11();
	}
}
