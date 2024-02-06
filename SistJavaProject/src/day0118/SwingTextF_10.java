package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import javax.swing.plaf.FontUIResource;

//2개의 텍스트 필드에 숫자를 넣고 버튼을 만든 후 클릭하면 라벨에 2+3=5와 같이 출력

public class SwingTextF_10 extends JFrame{
	
	Container cp;
	JTextField tfNum1, tfNum2;
	JButton btnAdd1,btnAdd2, btnAdd3, btnAdd4;
	JLabel lblNum1, lblNum2, lblResult;
	
	public SwingTextF_10() {
		super("텍스트 필드 문제");
		
		cp=this.getContentPane();
		
		this.setBounds(800, 100, 400, 400);
		cp.setBackground(new Color(255,255,200));
		setDesign();
		this.setVisible(true);
	}
	public void setDesign() {
		this.setLayout(null);
		
		lblNum1=new JLabel("숫자1");
		lblNum1.setBounds(20, 20, 50, 30);
		lblNum1.setBackground(Color.ORANGE);
		lblNum1.setOpaque(true);
		this.add(lblNum1);
		lblNum2=new JLabel("숫자2");
		lblNum2.setBounds(20, 60, 50, 30);
		lblNum2.setBackground(Color.ORANGE);
		lblNum2.setOpaque(true);
		this.add(lblNum2);
		
		tfNum1=new JTextField();
		tfNum1.setBounds(80, 20, 60, 30);
		this.add(tfNum1);
		tfNum2=new JTextField();
		tfNum2.setBounds(80, 60, 60, 30);
		this.add(tfNum2);
		
		btnAdd1=new JButton("+");
		btnAdd1.setBounds(20, 110, 50, 50);
		this.add(btnAdd1);
		
		btnAdd2=new JButton("-");
		btnAdd2.setBounds(90, 110, 50, 50);
		this.add(btnAdd2);
		
		btnAdd3=new JButton("*");
		btnAdd3.setBounds(160, 110, 50, 50);
		this.add(btnAdd3);
		
		btnAdd4=new JButton("/");
		btnAdd4.setBounds(230, 110, 50, 50);
		this.add(btnAdd4);
		
		lblResult=new JLabel("결과 나오는 곳", JLabel.CENTER);
		lblResult.setBounds(20, 170, 250, 60);
		lblResult.setBorder(new TitledBorder("결과확인"));
		lblResult.setBorder(new LineBorder(Color.BLUE, 4));
		lblResult.setFont(new Font("", Font.BOLD, 25)); //글꼴변경
		this.add(lblResult);
		
		//익명내부클래스 (생성과 동시에 실행 후 마치면 종료)
		btnAdd1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				int num1=Integer.parseInt(tfNum1.getText().trim()); //trim은 앞뒤공백 제거 후 전환
				int num2=Integer.parseInt(tfNum2.getText().trim());
				
				int sum=num1+num2;
				
				String s=num1+"+"+num2+"="+sum;
		
				lblResult.setText(s);
			}
		});
		btnAdd2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				int num1=Integer.parseInt(tfNum1.getText().trim()); //trim은 앞뒤공백 제거 후 전환
				int num2=Integer.parseInt(tfNum2.getText().trim());
				
				int sum=num1-num2;
				
				String s=num1+"-"+num2+"="+sum;
		
				lblResult.setText(s);
			}
		});
		btnAdd3.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				int num1=Integer.parseInt(tfNum1.getText().trim()); //trim은 앞뒤공백 제거 후 전환
				int num2=Integer.parseInt(tfNum2.getText().trim());
				
				int sum=num1*num2;
				
				String s=num1+"*"+num2+"="+sum;
		
				lblResult.setText(s);
			}
		});
		btnAdd4.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				int num1=Integer.parseInt(tfNum1.getText().trim()); //trim은 앞뒤공백 제거 후 전환
				int num2=Integer.parseInt(tfNum2.getText().trim());
				
				int sum=num1/num2;
				
				String s=num1+"/"+num2+"="+sum;
		
				lblResult.setText(s);
			}
		});
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingTextF_10();
	}
}
