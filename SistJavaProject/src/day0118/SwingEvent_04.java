package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingEvent_04 extends JFrame implements ActionListener{
	Container cp;
	JButton btn1, btn2, btn3;
	
	public SwingEvent_04(String title) {
		super(title);

		cp=this.getContentPane();

		this.setBounds(800, 100, 300, 300);
		cp.setBackground(new Color(255,255,200));
		
		initDesign();
		
		this.setVisible(true);
	}
	public void initDesign() {
		//레이아웃 변경
		this.setLayout(new FlowLayout());
		
		//버튼 3개 생성
		btn1=new JButton("버튼 #1");
		btn2=new JButton("버튼 #2");
		btn3=new JButton("버튼 #3");
		
		//버튼색상 변경
		btn1.setBackground(Color.PINK);
		btn2.setBackground(Color.ORANGE);
		btn3.setBackground(Color.GRAY);
		
		//버튼의 이벤트 발생.. 이벤트 핸들러와 이벤트발생객체를 연결
		btn1.addActionListener(this);
		btn2.addActionListener(this);
		btn3.addActionListener(this);
		
		//프레임에 추가
		this.add(btn1);
		this.add(btn2);
		this.add(btn3);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		Object ob=e.getSource(); //버튼이 어떤 메서드 호출인지 정확히 지정해주어야할 때
		
		//메세지를 다이얼로그 형태로 보여줌
		JOptionPane.showMessageDialog(this, "버튼클릭!!!");
		
		//버튼마다 다른 메세지를 출력
		if(ob==btn1)
			JOptionPane.showMessageDialog(this, "1번째 버튼클릭");
		else if(ob==btn2)
			JOptionPane.showMessageDialog(this, "2번째 버튼클릭");
		else if(ob==btn3)
			JOptionPane.showMessageDialog(this, "3번째 버튼클릭");
	}
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingEvent_04("스윙시작");
	}

}
