package day0118;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class SwingArrEvent_08 extends JFrame implements ActionListener{
	Container cp;
	JButton[] btn=new JButton[6];
	String[] btnLabel= {"Red","Green","Blue","Magenta","Gray","Yellow"};
	Color[] btnColors= {Color.RED, Color.GREEN, Color.BLUE,Color.MAGENTA,Color.GRAY,Color.YELLOW};
	
	public SwingArrEvent_08(String title) {
		super(title);
		
		cp=this.getContentPane();
		
		this.setBounds(800, 100, 600, 300);
		cp.setBackground(new Color(255,255,200));
		initDesign();
		this.setVisible(true);
	}
	public void initDesign() {
		//Panel은 기본이 FlowLayout
		JPanel panel=new JPanel();
		panel.setBackground(Color.ORANGE);
		this.add(panel, BorderLayout.NORTH); //프레임의 상단에 패널배치
		
		for(int i=0;i<btn.length;i++) {
			//버튼 6생성
			btn[i]=new JButton(btnLabel[i]);
			//버튼 6개 각각의 버튼색상 변경(btncolors)
			btn[i].setBackground(btnColors[i]);
			//버튼 6개 이벤트 추가
			btn[i].addActionListener(this);
			//panel에 버튼 6개 추가
			panel.add(btn[i]);
		
		}
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		//버튼을 누르면 프레임의 배경색 변경
		//버튼클릭시 창 제목 변경
		for(int i=0;i<btn.length;i++) {
			if(ob==btn[i]) {
				cp.setBackground(btnColors[i]);
				this.setTitle("Color: "+btnLabel[i]);
			}
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingArrEvent_08("배열버튼 이벤트_8");
	}
}
