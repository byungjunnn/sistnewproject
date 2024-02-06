package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingEvent_07 extends JFrame {
	Container cp;
	JButton btn1, btn2;
	
	public SwingEvent_07(String title) {
		super(title);
		
		cp=this.getContentPane();
		
		this.setBounds(800, 100, 300, 300);
		cp.setBackground(new Color(255,255,200));
		initDesign();
		this.setVisible(true);
	}
	public void initDesign() {
		this.setLayout(new FlowLayout());
		
		//Flow레이아웃으로 버튼 2개 생성
		//버튼색상 그레이로 변경, 버튼색상 그린으로 변경(텍스트)
		
		btn1=new JButton("버튼색상 그레이로 변경");
		this.add(btn1);
		
		btn2=new JButton("버튼색상 그린으로 변경");
		this.add(btn2);
		
		//버튼1 생성 및 이벤트 주기(익명내부클래스 형식)
		btn1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
//				getContentPane().setBackground(Color.GRAY);
				cp.setBackground(Color.GRAY);
			}
		});
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingEvent_07("스윙시작");
	}
}
