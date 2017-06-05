/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import Entity.Nhanvien;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import static javax.swing.WindowConstants.DO_NOTHING_ON_CLOSE;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Kuga
 */
public class Main_NV extends javax.swing.JFrame {

    /**
     * Creates new form Main_NV
     */
    Connection con;
    public Main_NV() {
        initComponents();
    }
    public Main_NV(Connection con) {
        initComponents();
        this.con=con;
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        this.addWindowListener(new WindowAdapter() {
                public void windowClosing(WindowEvent e) {
                    int hoi = JOptionPane.showConfirmDialog(null, "Bạn dang thao tác, xác nhận thoát (Yes)?",
                            "Cảnh Báo", JOptionPane.YES_NO_OPTION);
                    if (hoi == JOptionPane.YES_OPTION) {
                        try {
                            con.close();
                        } catch (SQLException ex) {
                            Logger.getLogger(Main_Admin.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        System.exit(0);
                    }
                }
        });
        init();
    }
    public void init(){
        String type="FALSE";
        System.out.println("sdf");
        if(type == "FALSE")
        {
            pnSuaNV.setEnabled(false);
            cbbPhong.setEnabled(false);
            tfLuong.setEnabled(false);
            tfPhuCap.setEnabled(false);
            btnCapNhatNV.setEnabled(false);
            
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        tpnNhanVien = new javax.swing.JTabbedPane();
        pnNhanVien = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tableNV = new javax.swing.JTable();
        btnLoadNV = new javax.swing.JButton();
        pnSuaNV = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        tfLuong = new javax.swing.JTextField();
        tfPhuCap = new javax.swing.JTextField();
        cbbPhong = new javax.swing.JComboBox<>();
        btnCapNhatNV = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        pnDeAn = new javax.swing.JPanel();
        pnThamGiaDA = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        jLabel10 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tableNV.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null}
            },
            new String [] {
                "Mã NV", "Họ tên", "Phái", "Ngày sinh", "SĐT", "Lương", "Phụ cấp", "Phòng ban", "Cấp bậc"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tableNV.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tableNVMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tableNV);
        if (tableNV.getColumnModel().getColumnCount() > 0) {
            tableNV.getColumnModel().getColumn(0).setResizable(false);
            tableNV.getColumnModel().getColumn(0).setHeaderValue("Mã NV");
            tableNV.getColumnModel().getColumn(1).setHeaderValue("Họ tên");
            tableNV.getColumnModel().getColumn(2).setHeaderValue("Phái");
            tableNV.getColumnModel().getColumn(3).setHeaderValue("Ngày sinh");
            tableNV.getColumnModel().getColumn(4).setHeaderValue("SĐT");
            tableNV.getColumnModel().getColumn(5).setHeaderValue("Lương");
            tableNV.getColumnModel().getColumn(6).setHeaderValue("Phụ cấp");
            tableNV.getColumnModel().getColumn(7).setHeaderValue("Phòng ban");
            tableNV.getColumnModel().getColumn(8).setHeaderValue("Cấp bậc");
        }

        btnLoadNV.setText("Lấy DS Nhân viên");
        btnLoadNV.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLoadNVActionPerformed(evt);
            }
        });

        pnSuaNV.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), "Sữa nhân viên"));
        pnSuaNV.setPreferredSize(new java.awt.Dimension(800, 200));

        jLabel6.setText("Lương:");

        jLabel7.setText("Phụ cấp:");

        jLabel8.setText("Phòng:");

        tfLuong.setText("500");
        tfLuong.setToolTipText("Lương cơ bản");

        tfPhuCap.setText("50");
        tfPhuCap.setToolTipText("Lương phụ cấp");

        cbbPhong.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "PB001", "PB002", "PB003", "PB004" }));
        cbbPhong.setSelectedIndex(3);
        cbbPhong.setToolTipText("PB001( Nhân Sự); \nPB002(Kế Hoạch); \nPB003(Đề Án); \nPB004( Kinh Doanh)"); // NOI18N

        btnCapNhatNV.setText("Cập nhật nhân viên");
        btnCapNhatNV.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCapNhatNVActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout pnSuaNVLayout = new javax.swing.GroupLayout(pnSuaNV);
        pnSuaNV.setLayout(pnSuaNVLayout);
        pnSuaNVLayout.setHorizontalGroup(
            pnSuaNVLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnSuaNVLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pnSuaNVLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(pnSuaNVLayout.createSequentialGroup()
                        .addComponent(jLabel8)
                        .addGap(18, 18, 18)
                        .addComponent(cbbPhong, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(pnSuaNVLayout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(tfPhuCap))
                    .addGroup(pnSuaNVLayout.createSequentialGroup()
                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(tfLuong, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(btnCapNhatNV, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        pnSuaNVLayout.setVerticalGroup(
            pnSuaNVLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnSuaNVLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pnSuaNVLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(cbbPhong, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(pnSuaNVLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(tfLuong, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(pnSuaNVLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(tfPhuCap, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnCapNhatNV)
                .addContainerGap(15, Short.MAX_VALUE))
        );

        jLabel1.setText("Danh sách nhân viên:");

        javax.swing.GroupLayout pnNhanVienLayout = new javax.swing.GroupLayout(pnNhanVien);
        pnNhanVien.setLayout(pnNhanVienLayout);
        pnNhanVienLayout.setHorizontalGroup(
            pnNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnNhanVienLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(pnNhanVienLayout.createSequentialGroup()
                .addComponent(btnLoadNV)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(pnNhanVienLayout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 807, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(pnSuaNV, javax.swing.GroupLayout.PREFERRED_SIZE, 182, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        pnNhanVienLayout.setVerticalGroup(
            pnNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pnNhanVienLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnLoadNV)
                .addGap(4, 4, 4)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pnNhanVienLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(pnSuaNV, javax.swing.GroupLayout.DEFAULT_SIZE, 164, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addContainerGap(267, Short.MAX_VALUE))
        );

        tpnNhanVien.addTab("Nhân viên", pnNhanVien);

        javax.swing.GroupLayout pnDeAnLayout = new javax.swing.GroupLayout(pnDeAn);
        pnDeAn.setLayout(pnDeAnLayout);
        pnDeAnLayout.setHorizontalGroup(
            pnDeAnLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 995, Short.MAX_VALUE)
        );
        pnDeAnLayout.setVerticalGroup(
            pnDeAnLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 492, Short.MAX_VALUE)
        );

        tpnNhanVien.addTab("Đề án", pnDeAn);

        javax.swing.GroupLayout pnThamGiaDALayout = new javax.swing.GroupLayout(pnThamGiaDA);
        pnThamGiaDA.setLayout(pnThamGiaDALayout);
        pnThamGiaDALayout.setHorizontalGroup(
            pnThamGiaDALayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 995, Short.MAX_VALUE)
        );
        pnThamGiaDALayout.setVerticalGroup(
            pnThamGiaDALayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 492, Short.MAX_VALUE)
        );

        tpnNhanVien.addTab("Tham gia ĐA", pnThamGiaDA);

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 995, Short.MAX_VALUE)
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 492, Short.MAX_VALUE)
        );

        tpnNhanVien.addTab("tab4", jPanel4);

        jLabel10.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel10.setText("Thông tin cá nhân");
        jLabel10.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel10MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(tpnNhanVien)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 142, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel10)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 30, Short.MAX_VALUE)
                .addComponent(tpnNhanVien, javax.swing.GroupLayout.PREFERRED_SIZE, 520, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnLoadNVActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLoadNVActionPerformed
        // TODO add your handling code here:
        Vector clums = new Vector();
        clums.add("Mã NV");
        clums.add("Họ tên");
        clums.add("Phái");
        clums.add("Ngày sinh");
        clums.add("SĐT");
        clums.add("Lương");
        clums.add("Phụ cấp");
        clums.add("Phòng ban");
        clums.add("Cấp bậc");
        Vector data = new Vector();
        String strGet = "SELECT* FROM QLDA.NHANVIEN ORDER BY MANV";
        try {
            PreparedStatement pstmt = con.prepareStatement(strGet);
            ResultSet rs = pstmt.executeQuery();
            if(rs!=null){
                while (rs.next()) {                    
                    Vector row = new Vector();
                    row.add(rs.getString(1));
                    row.add(rs.getString(2));
                    row.add(rs.getString(3));
                    row.add(rs.getDate(4));
                    row.add(rs.getString(5));
                    row.add(rs.getString(6));
                    row.add(rs.getString(7));
                    row.add(rs.getString(8));
                    row.add(rs.getString(9));
                    data.add(row);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        DefaultTableModel dtm_NV= new DefaultTableModel(data, clums);
        tableNV.setModel(dtm_NV);
        
    }//GEN-LAST:event_btnLoadNVActionPerformed

    private void btnCapNhatNVActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCapNhatNVActionPerformed
        int row = tableNV.getSelectedRow();
        if(row>=0)
        {
            String maNV=tableNV.getValueAt(row, 0).toString();
            String strGet = "UPDATE QLDA.NHANVIEN SET MAPHONG='"
                    + cbbPhong.getSelectedItem().toString()+ "',LUONG='"
                    + tfLuong.getText()+ "',PHUCAP='"
                    + tfPhuCap.getText()+ "' WHERE MANV='"
                    + maNV+ "'";
            System.out.println(strGet);
            try {
                PreparedStatement pstmt = con.prepareStatement(strGet);
                pstmt.executeUpdate();
                JOptionPane.showMessageDialog(null, "Cập nhật thành công.","Thông báo",1);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Xảy ra lỗi khi kết nối CSDL.","Thông báo",1);
                e.printStackTrace();
            }
    }
    }//GEN-LAST:event_btnCapNhatNVActionPerformed

    private void jLabel10MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel10MouseClicked
        // TODO add your handling code here:
        Main_Individual main_invi= new Main_Individual(this.getCon());
        main_invi.show(true);
    }//GEN-LAST:event_jLabel10MouseClicked

    private void tableNVMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tableNVMouseClicked
        // TODO add your handling code here:
        int row= tableNV.getSelectedRow();
        if(row>=0)
        {
            tfLuong.setText(tableNV.getValueAt(row, 5).toString());
            tfPhuCap.setText(tableNV.getValueAt(row, 6).toString());
            cbbPhong.setSelectedItem(tableNV.getValueAt(row, 7).toString());
        }
    }//GEN-LAST:event_tableNVMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Main_NV.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Main_NV.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Main_NV.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Main_NV.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Main_NV().setVisible(true);
            }
        });
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCapNhatNV;
    private javax.swing.JButton btnLoadNV;
    private javax.swing.JComboBox<String> cbbPhong;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JPanel pnDeAn;
    private javax.swing.JPanel pnNhanVien;
    private javax.swing.JPanel pnSuaNV;
    private javax.swing.JPanel pnThamGiaDA;
    private javax.swing.JTable tableNV;
    private javax.swing.JTextField tfLuong;
    private javax.swing.JTextField tfPhuCap;
    private javax.swing.JTabbedPane tpnNhanVien;
    // End of variables declaration//GEN-END:variables
}
