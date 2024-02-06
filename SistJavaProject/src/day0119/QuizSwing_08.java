package day0119;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.ButtonGroup;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class QuizSwing_08 extends JFrame implements ActionListener, ItemListener{
	JCheckBox cbGen;
	JCheckBox[] cb=new JCheckBox[4];
	JRadioButton[] rb=new JRadioButton[3];
	Color[] color= {Color.RED, Color.GREEN, Color.BLUE};
	JLabel lb;

	public QuizSwing_08(String title) {
		super(title);

		this.setBounds(800, 100, 500, 400);
		this.getContentPane().setBackground(new Color(255,200,200));
		initDesign();
		this.setVisible(true);
	}
	public void initDesign() {
		this.setLayout(null);

		cbGen=new JCheckBox("남자");
		cbGen.setBounds(20, 20, 50, 30);
		cbGen.setOpaque(false);
		this.add(cbGen);
		cbGen.addItemListener(this);
		
		//라디오 버튼
		String[] str= {"Red","Green","Blue"};
		JPanel pn1=new JPanel();
		pn1.setBounds(20, 70, 300, 50);
		pn1.setOpaque(false);
		pn1.setBorder(new TitledBorder("색상"));
		this.add(pn1);
		ButtonGroup bg=new ButtonGroup();
		int x=20;
		for(int i=0;i<rb.length;i++) {
			rb[i]=new JRadioButton(str[i], i==0?true:false);
			rb[i].setBounds(x, 70, 80, 30);
			x+=80;
			rb[i].setOpaque(false);
			pn1.add(rb[i]);
			bg.add(rb[i]);
			rb[i].addItemListener(this);
		}

		//체크박스
		JPanel pn2=new JPanel();
		pn2.setBounds(20, 120, 300, 50);
		pn2.setBorder(new TitledBorder("내가가본나라"));
		pn2.setOpaque(false);
		this.add(pn2);
		String[] country= {"일본","미국","프랑스","영국"};
		int x1=20;
		for(int i=0;i<cb.length;i++) {
			cb[i]=new JCheckBox(country[i]);
			cb[i].setBounds(x1, 120, 80, 30);
			x1+=80;
			cb[i].setOpaque(false);
			pn2.add(cb[i]);
			cb[i].addActionListener(this);
		}
		lb=new JLabel("메세지 결과", JLabel.CENTER);
		lb.setBounds(20, 200, 400, 100);
		lb.setBorder(new TitledBorder("내가 가본 나라"));
		lb.setBorder(new LineBorder(Color.WHITE, 5, true));
		lb.setFont(new Font("맑은 고딕", Font.BOLD, 15));
		lb.setOpaque(true);
		this.add(lb);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob=e.getSource();

		String msg="";
		int select=0;
		for(int i=0;i<cb.length;i++) {
			if(cb[i].isSelected()==true) {
				select++;
				msg+="["+cb[i].getText()+"]"+" ";
			}
		}
		if(select==0)
			lb.setText("내가 가본 나라는 없습니다");
		else {
			lb.setText("내가 가본 나라는"+msg+"입니다");
		}
		lb.setFont(new Font("", Font.BOLD, 15));
	}

	@Override
	public void itemStateChanged(ItemEvent e) {
		Object ob=e.getItem();

		if(ob==cbGen) {
			if(cbGen.isSelected()==true) {
				lb.setText(cbGen.getText()+"입니다");
				lb.setFont(new Font("", Font.ITALIC, 30));
				lb.setForeground(Color.YELLOW);
			}else {
				lb.setText("여자입니다");
				lb.setFont(new Font("", Font.ITALIC, 30));
				lb.setForeground(Color.white);
			}
		}
		for(int i=0;i<rb.length;i++) {
			if(ob==rb[i]) {
				lb.setBackground(color[i]);
			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new QuizSwing_08("주말 과제");
	}

}
