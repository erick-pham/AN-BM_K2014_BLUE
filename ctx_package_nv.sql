alter session set "_ORACLE_SCRIPT"=true;
-- CÁC HÀM PHỤC VỤ CÀI ĐẶT CHÍNH SÁCH VPD
--tạo package SET_NHANVIEN_CTX_PKG
create or replace package SET_NHANVIEN_CTX_PKG
as
    procedure GET_PHONGBAN;
	
    procedure CHECK_TRUONGPHONG;
    procedure CHECK_TRUONGPHONG_NHANSU;
    procedure CHECK_TRUONGPHONG_DEAN;
    procedure CHECK_TRUONGPHONG_KEHOACH;
    procedure CHECK_TRUONGPHONG_KINHDOAND;
    
	procedure CHECK_GIAMDOC;
end;

--tạo context NHANVIEN_CTX
CREATE OR REPLACE CONTEXT NHANVIEN_CTX USING SET_NHANVIEN_CTX_PKG;
-- nội dung pkg

create or replace package body SET_NHANVIEN_CTX_PKG
as
	procedure GET_PHONGBAN
		as PHONGBAN varchar2(5);
			begin
			select MAPHONG into PHONGBAN from QLDA.NHANVIEN where MANV = sys_context('userenv', 'session_user');
			dbms_session.set_context('NHANVIEN_CTX', 'GET_PHONGBAN', PHONGBAN);
		end;
  
	procedure CHECK_TRUONGPHONG
		as ISTRUONGPB varchar2(5);
			begin
				select case 
				when exists(select MAPHONG  from QLDA.PHONGBAN where TRUONGPHONG = sys_context('userenv', 'session_user'))
				then 'TRUE'
				else 'FALSE'
			end into ISTRUONGPB from dual;
			dbms_session.set_context('NHANVIEN_CTX', 'IS_TRUONGPB', ISTRUONGPB);
		end;
  
	procedure CHECK_TRUONGPHONG_NHANSU
		as IS_TRUONGPHONG_NHANSU varchar2(5);
			begin
				select case 
				when exists(select MAPHONG  from QLDA.PHONGBAN where TRUONGPHONG = sys_context('userenv', 'session_user') and MAPHONG ='PB001') 
				then 'TRUE'
				else 'FALSE'
			end into IS_TRUONGPHONG_NHANSU from dual;
			dbms_session.set_context('NHANVIEN_CTX', 'IS_TRUONGPHONG_NHANSU', IS_TRUONGPHONG_NHANSU);
		end;
  
	procedure CHECK_TRUONGPHONG_KEHOACH
		as IS_TRUONGPHONG_KEHOACH varchar2(5);
			begin
				select case 
				when exists(select MAPHONG  from QLDA.PHONGBAN where TRUONGPHONG = sys_context('userenv', 'session_user') and MAPHONG='PB002')
				then 'TRUE'
				else 'FALSE'
			end into IS_TRUONGPHONG_KEHOACH from dual;
			dbms_session.set_context('NHANVIEN_CTX', 'IS_TRUONGPHONG_KEHOACH', IS_TRUONGPHONG_KEHOACH);
		end;
  
    procedure CHECK_TRUONGPHONG_DEAN
		as IS_TRUONGPHONG_DEAN varchar2(5);
			begin
				select case 
				when exists(select MAPHONG  from QLDA.PHONGBAN where TRUONGPHONG = sys_context('userenv', 'session_user') and MAPHONG='PB003')
				then 'TRUE'
				else 'FALSE'
			end into IS_TRUONGPHONG_DEAN from dual;
			dbms_session.set_context('NHANVIEN_CTX', 'IS_TRUONGPHONG_DEAN', IS_TRUONGPHONG_DEAN);
		end;
  
	procedure CHECK_TRUONGPHONG_KINHDOAND
		as IS_TRUONGPHONG_KINHDOANH varchar2(5);
			begin
				select case 
				when exists(select MAPHONG  from QLDA.PHONGBAN where TRUONGPHONG = sys_context('userenv', 'session_user') and MAPHONG='PB004')
				then 'TRUE'
				else 'FALSE'
			end into IS_TRUONGPHONG_KINHDOANH from dual;
			dbms_session.set_context('NHANVIEN_CTX', 'IS_TRUONGPHONG_KINHDOANH', IS_TRUONGPHONG_KINHDOANH);
		end;
  
	procedure CHECK_GIAMDOC
		as ISGIAMDOC varchar2(5);
			begin
				select case 
				when exists(select MANV  from QLDA.NHANVIEN where MANV= sys_context('userenv', 'session_user') and CAPBAC = '1')
				then 'TRUE'
				else 'FALSE'
			end into ISGIAMDOC from dual;
			dbms_session.set_context('NHANVIEN_CTX', 'IS_GIAMDOC', ISGIAMDOC);
		end;
	
end;

--tạo logon trigger cho package
create or replace trigger set_NHANVIEN_CTX_TRIGGER after logon on database
begin
	QLDA.SET_NHANVIEN_CTX_PKG.GET_PHONGBAN;
    QLDA.SET_NHANVIEN_CTX_PKG.CHECK_TRUONGPHONG;
    QLDA.SET_NHANVIEN_CTX_PKG.CHECK_TRUONGPHONG_DEAN;
    QLDA.SET_NHANVIEN_CTX_PKG.CHECK_TRUONGPHONG_NHANSU;
    QLDA.SET_NHANVIEN_CTX_PKG.CHECK_TRUONGPHONG_KEHOACH;
	QLDA.SET_NHANVIEN_CTX_PKG.CHECK_GIAMDOC;
end;

