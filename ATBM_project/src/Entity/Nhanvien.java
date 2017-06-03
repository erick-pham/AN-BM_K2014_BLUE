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
public class Nhanvien {
    String maNV;
    String hoTen;
    String phai;
    Date ngaySinh;
    String sdt;
    String luong;
    String phuCap;
    String phongBan;
    String capBac;

    public Nhanvien(String maNV, String hoTen, String phai, Date ngaySinh, String sdt, String luong, String phuCap, String phongBan, String capBac) {
        this.maNV = maNV;
        this.hoTen = hoTen;
        this.phai = phai;
        this.ngaySinh = ngaySinh;
        this.sdt = sdt;
        this.luong = luong;
        this.phuCap = phuCap;
        this.phongBan = phongBan;
        this.capBac = capBac;
    }

    public Nhanvien() {
    }

    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getPhai() {
        return phai;
    }

    public void setPhai(String phai) {
        this.phai = phai;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getLuong() {
        return luong;
    }

    public void setLuong(String luong) {
        this.luong = luong;
    }

    public String getPhuCap() {
        return phuCap;
    }

    public void setPhuCap(String phuCap) {
        this.phuCap = phuCap;
    }

    public String getPhongBan() {
        return phongBan;
    }

    public void setPhongBan(String phongBan) {
        this.phongBan = phongBan;
    }

    public String getCapBac() {
        return capBac;
    }

    public void setCapBac(String capBac) {
        this.capBac = capBac;
    }

    @Override
    public String toString() {
        return "Nhanvien{" + "maNV=" + maNV + ", hoTen=" + hoTen + ", phai=" + phai + ", ngaySinh=" + ngaySinh + ", sdt=" + sdt + ", luong=" + luong + ", phuCap=" + phuCap + ", phongBan=" + phongBan + ", capBac=" + capBac + '}';
    }
}
