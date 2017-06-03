/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author Kuga
 */
public class DeAn {
    String maDA;
    String tenDA;
    Date ngayDatBau;
    String kinhPhi;

    public String getMaDA() {
        return maDA;
    }

    public void setMaDA(String maDA) {
        this.maDA = maDA;
    }

    public String getTenDA() {
        return tenDA;
    }

    public void setTenDA(String tenDA) {
        this.tenDA = tenDA;
    }

    public Date getNgayDatBau() {
        return ngayDatBau;
    }

    public void setNgayDatBau(Date ngayDatBau) {
        this.ngayDatBau = ngayDatBau;
    }

    public String getKinhPhi() {
        return kinhPhi;
    }

    public void setKinhPhi(String kinhPhi) {
        this.kinhPhi = kinhPhi;
    }

    public DeAn() {
    }
    
}
