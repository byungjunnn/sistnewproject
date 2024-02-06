package day0119;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class SwingTable_04 extends JFrame{

	Container cp;
	JTable table;
	JLabel lblTitle, lblOut;
	
	
	public SwingTable_04(String title) {
		super(title);
		
		cp=this.getContentPane();
		
		this.setBounds(800, 100, 300, 300);
		cp.setBackground(new Color(255,200,200));
		initDesign();
		this.setVisible(true);
	}
	public void initDesign() {
		String[][] data= {
				{"송혜교","서울","010-111-1111"},
				{"전지현","인천","010-222-2222"},
				{"이효리","부산","010-333-3333"}
		}; //3행 3열 2차원 배열
		
		String[] title= {"이름","주소","연락처"};
		
		lblTitle=new JLabel("JTable연습", JLabel.CENTER);
		lblOut=new JLabel("결과 출력하는 곳", JLabel.CENTER);
		
		table=new JTable(data, title);
		JScrollPane pane=new JScrollPane(table);
		
		//테이블에 마우스 이벤트 추가(내부 클래스 이용)
		table.addMouseListener(new TableEvent());
		this.add(lblTitle, BorderLayout.NORTH);
		this.add("Center", pane);
		this.add("South", lblOut);
		
	}
	//상속 받기 위한 내부 클래스
	class TableEvent extends MouseAdapter{
		
		@Override
		public void mouseClicked(MouseEvent e) {
			// TODO Auto-generated method stub
			super.mouseClicked(e);
			
			//System.out.println("테이블 출력");
			//선택한 행번호 얻기
			int rowNum=table.getSelectedRow();
			//JOptionPane.showMessageDialog(SwingTable_04.this, "행번호: "+rowNum);
			String str="이름: "+table.getValueAt(rowNum, 0)
					+", 주소: "+table.getValueAt(rowNum, 1)
					+", 연락처: "+table.getValueAt(rowNum, 2);
			
			lblOut.setText(str);
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingTable_04("스윙테이블");
	}

}
