package JavaProject1;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import oracleDb.DbConnect;

public class MycarUpdate extends JFrame implements ActionListener {

	Container cp;
	JLabel img, com, cmodel, fuel, fe, op, dis, en, sh, size, price, car_company, car_model;
	DefaultTableModel model;
	JTable table;
	JButton bt_su, bt_del;
	JLabel tf1, tf2, tf3, tf4, tf5, tf6, tf7, tf8;
	JLabel mimg, mnum, mrd, mgumsa, mavgac, mengine, mtire, mmile;
	JTextField tf11, tf12, tf13, tf14, tf15;
	JComboBox<String> cbengine, cbtire;

	DbConnect db = new DbConnect();

	public MycarUpdate(String title) {
		super(title);

		cp = this.getContentPane();

		this.setBounds(300, 100, 800, 690);
		cp.setBackground(new Color(255, 255, 255));
		initDesign();
		// this.setVisible(true);
	}

	public void initDesign() {
		this.setLayout(null);

		JPanel car1 = new JPanel();
		car1.setLayout(null);
		car1.setBounds(315, 30, 450, 255);
		this.add(car1);
		JLabel lbl1 = new JLabel("연료: ");
		JLabel lbl2 = new JLabel("연비: ");
		JLabel lbl3 = new JLabel("출력: ");
		JLabel lbl4 = new JLabel("배기량: ");
		JLabel lbl5 = new JLabel("엔진: ");
		JLabel lbl6 = new JLabel("변속: ");
		JLabel lbl7 = new JLabel("크기: ");
		JLabel lbl8 = new JLabel("가격: ");

		tf1 = new JLabel();
		tf2 = new JLabel();
		tf3 = new JLabel();
		tf4 = new JLabel();
		tf5 = new JLabel();
		tf6 = new JLabel();
		tf7 = new JLabel();
		tf8 = new JLabel();

		lbl1.setBounds(30, 80, 60, 30);
		lbl1.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		lbl1.setForeground(new Color(128, 128, 128));
		car1.add(lbl1);
		lbl2.setBounds(30, 120, 60, 30);
		lbl2.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		lbl2.setForeground(new Color(128, 128, 128));
		car1.add(lbl2);
		lbl3.setBounds(30, 160, 60, 30);
		lbl3.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		lbl3.setForeground(new Color(128, 128, 128));
		car1.add(lbl3);
		lbl4.setBounds(30, 200, 60, 30);
		lbl4.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		lbl4.setForeground(new Color(128, 128, 128));
		car1.add(lbl4);
		lbl5.setBounds(240, 80, 60, 30);
		lbl5.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		lbl5.setForeground(new Color(128, 128, 128));
		car1.add(lbl5);
		lbl6.setBounds(240, 120, 60, 30);
		lbl6.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		lbl6.setForeground(new Color(128, 128, 128));
		car1.add(lbl6);
		lbl7.setBounds(240, 160, 60, 30);
		lbl7.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		lbl7.setForeground(new Color(128, 128, 128));
		car1.add(lbl7);
		lbl8.setBounds(240, 200, 60, 30);
		lbl8.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		lbl8.setForeground(new Color(128, 128, 128));
		car1.add(lbl8);

		tf1.setBounds(80, 80, 120, 30);
		car1.add(tf1);
		tf2.setBounds(80, 120, 120, 30);
		car1.add(tf2);
		tf3.setBounds(80, 160, 120, 30);
		car1.add(tf3);
		tf4.setBounds(80, 200, 120, 30);
		car1.add(tf4);
		tf5.setBounds(290, 80, 120, 30);
		car1.add(tf5);
		tf6.setBounds(290, 120, 120, 30);
		car1.add(tf6);
		tf7.setBounds(290, 160, 120, 30);
		car1.add(tf7);
		tf8.setBounds(290, 200, 120, 30);
		car1.add(tf8);

		car_company = new JLabel("회사");
		car_model = new JLabel("모델명");

		car_company.setBounds(27, 25, 90, 30);
		car_company.setFont(new Font("맑은 고딕", Font.BOLD, 25));
		car1.add(car_company);
		car_model.setBounds(120, 25, 120, 30);
		car_model.setFont(new Font("맑은 고딕", Font.BOLD, 25));
		car1.add(car_model);

		bt_su = new JButton("수정");
		bt_su.setBounds(590, 605, 80, 30);
		add(bt_su);
		bt_su.addActionListener(this);

		bt_del = new JButton("삭제");
		bt_del.setBounds(685, 605, 80, 30);
		add(bt_del);
		bt_del.addActionListener(this);

		JPanel car2 = new JPanel();
		car2.setLayout(null);
		car2.setBounds(20, 300, 745, 290);
		this.add(car2);

		mimg = new JLabel("이미지");
		mnum = new JLabel("● 번호");
		mrd = new JLabel("● 등록일");
		mgumsa = new JLabel("● 최근 검사일");
		mavgac = new JLabel("● 평균 연비");
		mengine = new JLabel("● 엔진오일 및 오일필터");
		mtire = new JLabel("● 타이어");
		mmile = new JLabel("● 주행거리");

		mnum.setBounds(40, 17, 60, 30);
		mnum.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		mnum.setForeground(new Color(128, 128, 128));
		car2.add(mnum);
		mrd.setBounds(40, 80, 60, 30);
		mrd.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		mrd.setForeground(new Color(128, 128, 128));
		car2.add(mrd);
		mgumsa.setBounds(40, 145, 90, 30);
		mgumsa.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		mgumsa.setForeground(new Color(128, 128, 128));
		car2.add(mgumsa);
		mavgac.setBounds(40, 207, 90, 30);
		mavgac.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		mavgac.setForeground(new Color(128, 128, 128));
		car2.add(mavgac);

		mengine.setBounds(370, 20, 150, 30);
		mengine.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		mengine.setForeground(new Color(128, 128, 128));
		car2.add(mengine);
		mtire.setBounds(370, 100, 90, 30);
		mtire.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		mtire.setForeground(new Color(128, 128, 128));
		car2.add(mtire);
		mmile.setBounds(370, 180, 90, 30);
		mmile.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		mmile.setForeground(new Color(128, 128, 128));
		car2.add(mmile);

		tf11 = new JTextField();
		tf12 = new JTextField();
		tf13 = new JTextField();
		tf14 = new JTextField();
		tf15 = new JTextField();

		tf11.setBounds(55, 49, 200, 30);
		car2.add(tf11);
		tf12.setBounds(55, 112, 200, 30);
		car2.add(tf12);
		tf13.setBounds(55, 177, 200, 30);
		car2.add(tf13);
		tf14.setBounds(55, 240, 200, 30);
		car2.add(tf14);
		tf15.setBounds(380, 216, 200, 30);
		car2.add(tf15);

		String[] engine = { "교체완료", "교체필요" };
		cbengine = new JComboBox<String>(engine);
		cbengine.setBounds(380, 58, 200, 30);
		car2.add(cbengine);

		String[] tire = { "이상없음", "이상있음", "이상있음(점검필요)" };
		cbtire = new JComboBox<String>(tire);
		cbtire.setBounds(380, 137, 200, 30);
		car2.add(cbtire); 

		ImageIcon icon = new ImageIcon("imgs/tossan.png");
		Image img = icon.getImage();
		Image changeImg = img.getScaledInstance(300, 150, Image.SCALE_SMOOTH);
		ImageIcon changeIcon = new ImageIcon(changeImg);
		JLabel lbimage = new JLabel(changeIcon, JLabel.CENTER);
		lbimage.setBounds(30, 100, 250, 150);
		add(lbimage);

	}

	// delete
	public void deleteMycar(String num) {
		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;
		String sql = "delete from mycar where mycar_num like '%" + num + "%'";

		try {
			pstmt = conn.prepareStatement(sql);
			int n = pstmt.executeUpdate();
			if (n == 0) {
				JOptionPane.showMessageDialog(this, "등록되지 않은 차량 번호입니다");
			} else {
				JOptionPane.showMessageDialog(this, "삭제되었습니다");
				dispose();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// update
	public void updateMycar(String num) {
		String mynum = tf11.getText();
		String myrd = tf12.getText();
		String mygumsa = tf13.getText();
		String myavgac = tf14.getText();
		String mymile = tf15.getText();
		String myengine = cbengine.getSelectedItem().toString();
		String mytire = cbtire.getSelectedItem().toString();

		String sql = "update mycar set mycar_num=?, mycar_rd=?, mycar_gumsa=?, mycar_avgac=?, mycar_engine=?, mycar_tire=?, mycar_mile=? where mycar_num like '____"
				+ num + "'";

		Connection conn = db.getOracle();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mynum);
			pstmt.setString(2, myrd);
			pstmt.setString(3, mygumsa);
			pstmt.setString(4, myavgac);
			pstmt.setString(5, myengine);
			pstmt.setString(6, mytire);
			pstmt.setString(7, mymile);

			int n = pstmt.executeUpdate();

			if (n == 0)
				JOptionPane.showMessageDialog(null, "없는 번호입니다");
			else
				JOptionPane.showMessageDialog(null, "수정되었습니다");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();

		if (ob == bt_su) {
			String num = JOptionPane.showInputDialog("차량 번호 뒷자리를 입력해주세요");
			if (num != null)
				updateMycar(num);
		} else if (ob == bt_del) {
			String num = JOptionPane.showInputDialog("차량 번호 뒷자리를 입려해주세요!");
			if (num != null)
				deleteMycar(num);

		}
	}

	// public static void main(String[] args) {
	// new mainpage_01("스윙 시작");
	// }

}