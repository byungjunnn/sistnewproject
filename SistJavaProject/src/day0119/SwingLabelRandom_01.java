package day0119;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.plaf.FontUIResource;

public class SwingLabelRandom_01 extends JFrame implements ActionListener{
	Container cp;
	JLabel[] lb=new JLabel[9];
	String[] str= {"샌드위치","햄버거","콜라","사이다","요거트","스파게티","피자","치즈","리조또"};
	JButton bt;
	
	public SwingLabelRandom_01(String title) {
		super(title);
		
		cp=this.getContentPane();
		
		this.setBounds(800, 100, 500, 530);
		cp.setBackground(new Color(255,255,200));
		initDesign();
		this.setVisible(true);
	}
	public void initDesign() {
		//패널을 프레임의 센터에 추가
		Panel pCenter=new Panel(new GridLayout(3, 3));
		this.add(pCenter, BorderLayout.CENTER);
		
		//라벨 생성 및 패널에 추가
		for(int i=0;i<lb.length;i++) {
			lb[i]=new JLabel(str[i],JLabel.CENTER);
			lb[i].setFont(new Font("궁서체", Font.BOLD, 15));
			lb[i].setOpaque(true); //투명도, true면 불투명
			int r=(int)(Math.random()*256);
			int g=(int)(Math.random()*256);
			int b=(int)(Math.random()*256);
			lb[i].setBackground(new Color(r,g,b));
			pCenter.add(lb[i]); //패널에 라벨추가
		}
		//버튼 생성
		bt=new JButton("라벨 색상 변경"); 
		bt.addActionListener(this);
		this.add(bt, BorderLayout.SOUTH); //프레임 하단에 버튼 생성 후 추가
		
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		for(int i=0;i<lb.length;i++) {
			
			//rgb칼라는 0~255까지 색, R, G, B값 필요
			int r=(int)(Math.random()*256);
			int g=(int)(Math.random()*256);
			int b=(int)(Math.random()*256);
			lb[i].setBackground(new Color(r,g,b));
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingLabelRandom_01("랜덤컬러생성_1");
	}
}
