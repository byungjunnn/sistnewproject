package day0118;

import java.awt.Color;
import java.awt.Container;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class SwingComponent_09 extends JFrame{
	Container cp;
	JTextField text1, text2;
	JLabel lbl1, lbl2, lbl3, lbl4;
	Icon icon1=new ImageIcon("C:\\sist0103\\image\\swingimage\\chick.gif");
	Icon icon2=new ImageIcon("C:\\sist0103\\image\\swingimage\\ahiru_a001.gif");
	
	public SwingComponent_09(String title) {
		super(title);
		
		cp=this.getContentPane();
		
		this.setBounds(800, 100, 600, 300);
		cp.setBackground(new Color(255,255,200));
		initDesign();
		this.setVisible(true);
	}
	
	public void initDesign() {
		this.setLayout(null);
		
		text1=new JTextField();
		text1.setBounds(10, 20, 120, 30);
		this.add(text1);
		
		text2=new JTextField("Have a Nice Day");
		text2.setBounds(10, 60, 120, 30);
		this.add(text2);
		
		lbl1=new JLabel("안녕하세요", JLabel.CENTER);
		lbl1.setBounds(10, 100, 200, 30);
		lbl1.setBackground(Color.ORANGE);
		lbl1.setOpaque(true); //불투명 모드
		this.add(lbl1);
		
		lbl2=new JLabel("해피데이", icon1, JLabel.RIGHT);
		lbl2.setBounds(10, 150, 200, 30);
		lbl2.setBorder(new LineBorder(Color.RED));
		this.add(lbl2);
		
		lbl3=new JLabel("스윙공부", icon2, JLabel.CENTER);
		lbl3.setBounds(10, 180, 200, 30);
		lbl3.setBorder(new TitledBorder("쌍용교육"));
		this.add(lbl3);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		
		lbl4=new JLabel(sdf.format(new Date()),icon1,JLabel.CENTER);
		lbl4.setBounds(10, 210, 300, 30);
		lbl4.setBorder(new LineBorder(Color.pink, 3, true));
		this.add(lbl4);
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingComponent_09("스윙컴포넌트_9");
	}
}
