package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingBtnEvent_05 extends JFrame implements ActionListener{

	Container cp;
	JButton btn1, btn2;
	public SwingBtnEvent_05(String title) {
		super(title);
		
		cp=this.getContentPane();
		
		this.setBounds(800, 100, 300, 300);
		cp.setBackground(new Color(255,255,200));
		initDesign();
		
		this.setVisible(true);
	}
	
	public void initDesign() {
		this.setLayout(new FlowLayout());
		
		btn1=new JButton("◀");
		btn2=new JButton("▶");
		
		//버튼 색상
		btn1.setBackground(Color.BLUE);
		btn2.setBackground(Color.CYAN);
		
		//글자 색상
		btn1.setForeground(Color.WHITE);
		btn2.setForeground(Color.WHITE);
		
		this.add(btn1);
		this.add(btn2);
		
		//이벤트객체 연결(this가 이벤트객체_액션리스너)
		btn1.addActionListener(this);
		btn2.addActionListener(this);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob=e.getSource();
		
		JOptionPane.showMessageDialog(this, "클릭!!");
		
		if(ob==btn1)
			JOptionPane.showMessageDialog(this, "파랑색");
		else if(ob==btn2)
			JOptionPane.showMessageDialog(this, "청록색");
	}
	public static void main(String[] args) {

		new SwingBtnEvent_05("버튼이벤트5");
	}


}
