package JavaProject1;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

import oracleDb.DbConnect;

public class Jdbc_Car extends JFrame implements ActionListener{
	Container cp;
	JLabel lbTitle, lbcompany, lbmodel, lbrd, lbprice, lbfuel, lbfe, lbop, lbimage;
	JTextField tfNum;
	JButton bt_jo, bt_re;
	DefaultTableModel model;
	JTable table;

	DbConnect db=new DbConnect();
	MycarUpdate mycarupdate=new MycarUpdate("내 자동차 정보");

	public Jdbc_Car() {
		setTitle("자동차 관리 시스템");
		cp = this.getContentPane();

		this.setSize(960, 400);
		cp.setBackground(Color.WHITE);
		this.setLocationRelativeTo(null);
		this.initDesign();
		this.setVisible(true);
	}

	public void initDesign() {
		this.setLayout(null);

		lbTitle = new JLabel("내 차 조회하기", JLabel.CENTER);
		lbTitle.setBounds(20, 20, 300, 50);
		lbTitle.setBorder(new LineBorder(Color.BLACK, 3));
		lbTitle.setFont(new Font("맑은 고딕", Font.BOLD, 25));
		this.add(lbTitle);

		tfNum = new JTextField();
		tfNum.setBounds(20, 80, 300, 30);
		add(tfNum);

		bt_jo = new JButton("조회");
		bt_jo.setBounds(240, 120, 80, 30);
		add(bt_jo);
		bt_jo.addActionListener(this);
		
		bt_re = new JButton("새로고침");
		bt_re.setBounds(130, 120, 90, 30);
		add(bt_re);
		bt_re.addActionListener(this);

//		ImageIcon icon=new ImageIcon("imgs/jungbi.png");
//		Image img=icon.getImage();
//		Image changeImg=img.getScaledInstance(300, 300, Image.SCALE_SMOOTH);
//		ImageIcon changeIcon=new ImageIcon(changeImg);
//		lbimage=new JLabel(changeIcon, JLabel.CENTER);
//		lbimage.setBounds(35, 190, 280, 130);
//		add(lbimage);
		
		ImageIcon icon=new ImageIcon("imgs/cars.png");
		Image img=icon.getImage();
		Image changeImg=img.getScaledInstance(270, 200, Image.SCALE_SMOOTH);
		ImageIcon changeIcon=new ImageIcon(changeImg);
		lbimage=new JLabel(changeIcon, JLabel.CENTER);
		lbimage.setBounds(0, 210, 300, 150);
		add(lbimage);

		String[] title = { "No", "회사", "모델명", "번호", "등록일자" };

		model = new DefaultTableModel(title, 0);
		table = new JTable(model);
		JScrollPane jScollPane = new JScrollPane(table);
		jScollPane.setBounds(360, 20, 560, 320);
		table.getColumn("No").setPreferredWidth(10);
		DefaultTableCellRenderer dtcr = new DefaultTableCellRenderer();
		dtcr.setHorizontalAlignment(SwingConstants.CENTER);
		TableColumnModel tcm = table.getColumnModel();

		for(int i=0;i<tcm.getColumnCount(); i++) {
			tcm.getColumn(i).setCellRenderer(dtcr);
		}
		this.add("Center", jScollPane);

		model.setRowCount(0);
		selectCar();

	}
	//1번 프레임 테이블 조회
	public void selectCar() {

		model.setRowCount(0);

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select cno, car_company,car_model,c.mycar_num,to_char(mycar_rd,'yy-mm-dd') mycar_rd from car c, mycar m where c.mycar_num=m.mycar_num order by cno ";

		conn = db.getOracle();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Vector<String> data = new Vector<String>();

				data.add(rs.getString("cno"));
				data.add(rs.getString("car_company"));
				data.add(rs.getString("car_model"));
				data.add(rs.getString("mycar_num"));
				data.add(rs.getString("mycar_rd"));

				// 테이블에 추가
				model.addRow(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		//테이블 클릭시 2번 프레임 출력 후 데이터 추가
		table.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				super.mouseClicked(e);

				int row=table.getSelectedRow();
				if (row != -1) {
					String num=JOptionPane.showInputDialog(null, "차량 번호 뒷자리를 입력해주세요", "차량 정보 상세보기", JOptionPane.PLAIN_MESSAGE);

					String sql="select c.car_company, c.car_model,c.car_fuel, c.car_fe, c.car_op, c.car_dis, c.car_en, c.car_sh, c.car_size, c.car_price,m.mycar_num, to_char(m.mycar_rd,'yyyy-mm-dd') mycar_rd, to_char(m.mycar_gumsa,'yyyy-mm-dd')"
							+ "mycar_gumsa, m.mycar_avgac, m.mycar_mile, m.mycar_engine, m.mycar_tire from car c,mycar m where m.mycar_num=c.mycar_num and m.mycar_num like '____" + num + "'";

					Connection conn=db.getOracle();
					PreparedStatement pstmt=null;
					ResultSet rs=null;

					try {
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						if(rs.next()) {
							mycarupdate.car_company.setText(rs.getString("car_company"));
							mycarupdate.car_model.setText(rs.getString("car_model"));
							mycarupdate.tf1.setText(rs.getString("car_fuel"));
							mycarupdate.tf2.setText(rs.getString("car_fe"));
							mycarupdate.tf3.setText(rs.getString("car_op"));
							mycarupdate.tf4.setText(rs.getString("car_dis"));
							mycarupdate.tf5.setText(rs.getString("car_en"));
							mycarupdate.tf6.setText(rs.getString("car_sh"));
							mycarupdate.tf7.setText(rs.getString("car_size"));
							mycarupdate.tf8.setText(rs.getString("car_price"));
							mycarupdate.tf11.setText(rs.getString("mycar_num"));
							mycarupdate.tf12.setText(rs.getString("mycar_rd"));
							mycarupdate.tf13.setText(rs.getString("mycar_gumsa"));
							mycarupdate.tf14.setText(rs.getString("mycar_avgac"));
							mycarupdate.tf15.setText(rs.getString("mycar_mile"));
							mycarupdate.cbengine.setSelectedItem(rs.getString("mycar_engine"));
							mycarupdate.cbtire.setSelectedItem(rs.getString("mycar_tire"));


							mycarupdate.setVisible(true);
						}
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}finally {
						db.dbClose(rs, pstmt, conn);
					}
					if(num==null)
						mycarupdate.setVisible(false);
				}
			}});
	}

	public void selectMycar() {
		model.setRowCount(0);
		String num = tfNum.getText();

		String sql = "select cno, car_company, car_model,c.mycar_num,to_char(mycar_rd,'yy-mm-dd') mycar_rd from car c, mycar m where c.mycar_num=m.mycar_num and c.mycar_num Like '%"
				+ num + "%' order by cno";

		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Vector<String> data = new Vector<String>();

				data.add(rs.getString("cno"));
				data.add(rs.getString("car_company"));
				data.add(rs.getString("car_model"));
				data.add(rs.getString("mycar_num"));
				data.add(rs.getString("mycar_rd"));

				// 테이블에 추가
				model.addRow(data);

			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob=e.getSource();

		if(ob==bt_jo) {
			selectMycar();
			
		}else if(ob==bt_re) {
			selectCar();
			tfNum.setText("");
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Jdbc_Car();
	}
}