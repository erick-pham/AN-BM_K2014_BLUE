alter session set "_ORACLE_SCRIPT"=true;
CREATE USER QLDA IDENTIFIED BY QLDA;
GRANT QLDA, RESOURCE TO QLDA WITH ADMIN OPTION;
GRANT CREATE SESSION TO QLDA;
GRANT ALL PRIVILEGES TO QLDA;
GRANT DBA TO QLDA;
GRANT EXEMPT ACCESS POLICY TO QLDA;

-- LOGIN AS QLDA
/* tạo bảng nhân viên*/
CREATE TABLE NHANVIEN 
(
  MANV VARCHAR2(5)
, HOTEN VARCHAR2(50) 
, PHAI VARCHAR2(5)
, NGAYSINH DATE
, DIENTHOAI VARCHAR2(50) 
, LUONG NUMBER
, PHUCAP NUMBER
, MAPHONG VARCHAR2(5)
, CAPBAC NUMBER --::=1 nếu là giám đốc
, CONSTRAINT NHANVIEN_PK PRIMARY KEY(MANV)
);
/* tạo bảng phong ban*/
CREATE TABLE PHONGBAN 
(
  MAPHONG VARCHAR2(5)
, TENPHONG VARCHAR2(50) 
, TRUONGPHONG VARCHAR2(5) 
, NGAYNHANCHUC DATE 
, CONSTRAINT PHONGBAN_PK PRIMARY KEY(MAPHONG)
);

/* tạo bảng dự án*/
CREATE TABLE DEAN 
(
  MADA VARCHAR2(5)
, TENDA VARCHAR2(50)
, NGAYBATDAU DATE
, CONSTRAINT DEAN_PK PRIMARY KEY(MADA) 
);

/* tạo bảng phân công*/
CREATE TABLE THAMGIADEAN
(
  MANV VARCHAR2(5)
, DEAN VARCHAR2(5)
, THOIGIAN DATE
, TRANGTHAI VARCHAR2(50)
, CONSTRAINT PHANCONG_PK PRIMARY KEY(MANV,DEAN)
);

/* khóa ngoại*/
ALTER TABLE NHANVIEN ADD CONSTRAINT FK_NHANVIEN_PHONGBAN FOREIGN KEY (MAPHONG) REFERENCES PHONGBAN(MAPHONG);
ALTER TABLE THAMGIADEAN ADD CONSTRAINT FK_THAMGIADEAN_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
ALTER TABLE THAMGIADEAN ADD CONSTRAINT FK_THAMGIADEAN_DEAN FOREIGN KEY (DEAN) REFERENCES DEAN(MADA);
ALTER TABLE PHONGBAN ADD CONSTRAINT FK_PHONGBAN_NHANVIEN FOREIGN KEY (TRUONGPHONG) REFERENCES NHANVIEN(MANV);

/*PHÒNG BAN*/
insert into PHONGBAN(MAPHONG,TENPHONG,TRUONGPHONG,NGAYNHANCHUC)VALUES ('PB001','Nhân Sự',null,TO_DATE('25/04/2017','DD/MM/YYYY'));
insert into PHONGBAN(MAPHONG,TENPHONG,TRUONGPHONG,NGAYNHANCHUC)VALUES ('PB002','Kế Hoạch',null,TO_DATE('20/04/2017','DD/MM/YYYY'));
insert into PHONGBAN(MAPHONG,TENPHONG,TRUONGPHONG,NGAYNHANCHUC)VALUES ('PB003','Đề Án',null,TO_DATE('2/04/2017','DD/MM/YYYY'));
insert into PHONGBAN(MAPHONG,TENPHONG,TRUONGPHONG,NGAYNHANCHUC)VALUES ('PB004','Kinh Doanh',null,TO_DATE('5/04/2017','DD/MM/YYYY'));

/*DATA NHÂN VIÊN*/
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV100','Giám Đốc T','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567895',999,99,'PB001',1);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV101','Trần Văn A','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567895',990,99,'PB001',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV102','Trần Văn B','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1123456789',980,80,'PB001',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV103','Cao Nhất C','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1223456789',970,50,'PB001',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV104','Cao Nhất D','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1233456789',960,50,'PB001',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV105','Lùn Nhất E','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234456789',950,50,'PB001',0);
                                                                                                                  
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV106','Lùn Nhất F','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234556789',900,80,'PB002',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV107','Cao Mông G','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234566789',890,50,'PB002',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV108','Cao Mông H','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567893',870,50,'PB002',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV109','Mộng Si AB','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567897',860,50,'PB002',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV110','Lùn Thế Kỷ','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234556789',840,50,'PB002',0);
                                                                                                                     
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV111','Dương QuáA','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567894',700,80,'PB003',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV112','Cô Long AA','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567897',790,50,'PB003',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV113','Quách Tĩnh','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234556789',780,50,'PB003',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV114','Hoàng Dung','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567894',770,50,'PB003',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV115','Lý Mạc Sầu','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234556789',760,50,'PB003',0);
                                                          
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV116','Trần Cao A','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567894',900,80,'PB004',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV117','Lặc Lạc AB','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567897',980,50,'PB004',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV118','A Hữu Dung','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234556789',970,50,'PB004',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV119','B Thập Lục','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567894',960,50,'PB004',0);
insert into NHANVIEN (MANV,HOTEN,PHAI,NGAYSINH,DIENTHOAI,LUONG,PHUCAP,MAPHONG,CAPBAC)VALUES ('NV120','QU Hoán Vũ','Nam',TO_DATE('5/04/2017','DD/MM/YYYY'),'1234567894',950,50,'PB004',0);

/*DATA ĐỀ ÁN*/
insert into DEAN(MADA,NGAYBATDAU,TENDA)VALUES ('DA001',TO_DATE('5/04/2017','DD/MM/YYYY'),'Thoát Nước');
insert into DEAN(MADA,NGAYBATDAU,TENDA)VALUES ('DA002',TO_DATE('5/04/2017','DD/MM/YYYY'),'Tự Động Hóa');
insert into DEAN(MADA,NGAYBATDAU,TENDA)VALUES ('DA003',TO_DATE('5/04/2017','DD/MM/YYYY'),'Autobot');
insert into DEAN(MADA,NGAYBATDAU,TENDA)VALUES ('DA004',TO_DATE('5/04/2017','DD/MM/YYYY'),'Xây Nhà');
insert into DEAN(MADA,NGAYBATDAU,TENDA)VALUES ('DA005',TO_DATE('5/04/2017','DD/MM/YYYY'),'Xây Đê');
/*data phân công*/

insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV117','DA001',NULL,'Chưa duyệt');
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV120','DA001',NULL,'Chưa duyệt');                                                                    
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV117','DA002',NULL,'Chưa duyệt');
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV118','DA002',NULL,'Chưa duyệt');                                                                       
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV118','DA003',NULL,'Chưa duyệt');
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV119','DA003',NULL,'Chưa duyệt');                                                                        
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV117','DA004',NULL,'Chưa duyệt');
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV119','DA004',NULL,'Chưa duyệt');
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV118','DA005',NULL,'Chưa duyệt');
insert into THAMGIADEAN (MANV,DEAN,THOIGIAN,TRANGTHAI)VALUES ('NV120','DA005',NULL,'Chưa duyệt');


update PHONGBAN set TRUONGPHONG='NV101' where MAPHONG='PB001';
update PHONGBAN set TRUONGPHONG='NV106' where MAPHONG='PB002';
update PHONGBAN set TRUONGPHONG='NV111' where MAPHONG='PB003';
update PHONGBAN set TRUONGPHONG='NV116' where MAPHONG='PB004';

--Tạo user từ mã nhân viên
declare
  TEMP varchar2(200);
begin
for MANV in (select MANV from NHANVIEN)
loop
  TEMP := 'create user ' || MANV.MANV || ' identified by ' || MANV.MANV || ' default tablespace users temporary tablespace temp';
  execute immediate TEMP;
end loop;
end;     

-- Cấp quyền đăng nhập và tọa session
declare
  TEMP varchar2(500);
begin
for USERNAME in (select MANV from NHANVIEN)
loop
  TEMP := 'grant create session to ' || USERNAME.MANV;
  execute immediate TEMP;
end loop;
end;


-- LOGIN AS QLDA, chạy các lệnh bên dưới để tạo role--
CREATE ROLE R_NV;
CREATE ROLE R_GIAMDOC;
create role R_NV_PHONG_NHANSU;
create role R_NV_PHONG_KEHOACH;
create role R_NV_PHONG_KINHDOANH;
create role R_NV_PHONG_DEAN;
create role R_TRUONG_PHONG;
create role R_TRUONG_PHONG_DEAN;

-- ROLE NHÂN VIÊN
GRANT SELECT ON QLDA.NHANVIEN TO R_NV;
GRANT UPDATE(HOTEN,PHAI,NGAYSINH,DIENTHOAI) ON QLDA.NHANVIEN TO R_NV;
GRANT SELECT ON QLDA.THAMGIADEAN TO R_NV;

-- ROLE GIÁM ĐỐC
GRANT SELECT ON QLDA.NHANVIEN TO R_GIAMDOC;
GRANT UPDATE(LUONG,PHUCAP,MAPHONG) on QLDA.NHANVIEN TO R_GIAMDOC;
GRANT SELECT ON QLDA.THAMGIADEAN TO R_GIAMDOC;
GRANT SELECT ON QLDA.DEAN TO R_GIAMDOC;

-- ROLE PHÒNG NHÂN SỰ
GRANT SELECT ON QLDA.NHANVIEN TO R_NV_PHONG_NHANSU;
GRANT update(LUONG,PHUCAP,MAPHONG) ON QLDA.NHANVIEN TO R_NV_PHONG_NHANSU;
GRANT SELECT ON QLDA.THAMGIADEAN TO R_NV_PHONG_NHANSU;

-- ROLE NHÂN VIÊN PHÒNG ĐỀ ÁN
GRANT SELECT,UPDATE, INSERT, DELETE ON QLDA.THAMGIADEAN TO R_NV_PHONG_DEAN;
GRANT SELECT ON QLDA.DEAN TO R_NV_PHONG_DEAN;

-- ROLE NHÂN VIÊN PHÒNG KINH DOANH
GRANT SELECT ON QLDA.THAMGIADEAN TO R_NV_PHONG_KINHDOANH;
GRANT SELECT ON QLDA.DEAN TO R_NV_PHONG_KINHDOANH;

-- ROLE NHÂN VIÊN PHÒNG KẾ HOẠCH
GRANT SELECT,UPDATE, INSERT, DELETE ON QLDA.DEAN TO R_NV_PHONG_KEHOACH;

-- ROLE TRƯỞNG PHÒNG
GRANT SELECT ON QLDA.NHANVIEN TO R_TRUONG_PHONG;
GRANT SELECT ON QLDA.THAMGIADEAN TO R_TRUONG_PHONG;
GRANT SELECT ON QLDA.DEAN TO R_TRUONG_PHONG;
-- ROLE TRƯỞNG PHÒNG ĐỀ ÁN
GRANT SELECT ON QLDA.THAMGIADEAN TO R_TRUONG_PHONG_DEAN;
GRANT UPDATE(THOIGIAN,TRANGTHAI) ON QLDA.THAMGIADEAN TO R_TRUONG_PHONG_DEAN;





select * from QLDA.NHANVIEN;
select * from QLDA.PHONGBAN;
select * from QLDA.THAMGIADEAN;
select * from QLDA.DEAN;

-- lấy ds user trong QLDE (NV100 ->)
select* from DBA_users where username like 'NV%';


-- hiển thị các role có trong CSDL
select * from Dba_roles;
select * from Dba_roles;
select * from Dba_role_privs;
select * from Role_tab_privs;
select * from User_tab_privs;
select * from Dba_profiles;
select * from User_tab_privs;
select * from dba_role_privs where grantee = 'NV101';
select * from User_tab_privs where grantee = 'NV101';
select * from User_role_privs where grantee = 'NV101';