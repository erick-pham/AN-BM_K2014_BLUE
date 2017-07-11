select * from QLDA.NHANVIEN;
select * from QLDA.PHONGBAN;
select * from QLDA.THAMGIADEAN;
select * from QLDA.DEAN;

-- lấy ds user trong QLDE (NV100 ->)
select username from DBA_users where username like 'NV%' ORDER BY username;
grant select on QLDA.Nhanvien to NV101;

-- hiển thị các role có trong CSDL do QLDA tạo ra
select * from Dba_roles where ROLE like 'ROLE%';

-- hiển thị các role mà NV101 được cấp
select * from Dba_role_privs where grantee like 'NV101';

-- hiển thị các quyền được cấp trên bảng của các role
select * from Role_tab_privs where role like 'ROLE_%';

-- các user và role của họ
select * from Dba_role_privs where Dba_role_privs.grantee like 'NV%';

-- quyền mức cột của user NV101 dựa trên role
select distinct grantee,table_name,column_name,privilege from Role_tab_privs,Dba_role_privs where granted_role like ROLE and grantee like 'NV101' order by table_name,column_name,privilege ASC;

-- danh sách các role có trong hệ thống
select * from Dba_roles;

select * from Dba_tab_privs;

-- quyền của role trên bảng
select * from Role_tab_privs;

-- các role được gán cho user session
select * from User_role_privs;

-- quyền object của user session
select * from User_tab_privs;

-- quyền trên col của user session
select * from User_col_privs;

SELECT * FROM DBA_col_PRIVS where grantee like 'NV%';
SELECT * FROM DBA_tab_PRIVS where grantee like 'NV%';

select * from Dba_profiles;

select * from dba_role_privs where grantee = 'NV101';


grant role_nv to NV101;

revoke role_giamdoc from nv101;

grant select on phongban to nv101;
grant insert on phongban to role_xemPB;
revoke insert on phongban from role_xempb;
revoke select on phongban from nv101;
Revoke all on PHONGBAN from ROLE_GIAMDOC;
Revoke UPDATE on PHONGBAN from ROLE_XEMPB;
-- thông tin quyền hệ thống mức cột của user session
select * from Dba_col_privs where grantee like 'ROLE_NV';

-- quyền của role mức cột của bảng
select * from Role_tab_privs where role like 'ROLE_TRUONG_PHONG_DEAN';

-- xem các thông tin đang login của các user
select * from dba_audit_session;

-- lấy tên session_user hiện tại
select sys_context('userenv', 'session_user') from dual ;
select sys_context('userenv', 'ISDBA') from dual;
grant ROLE_NV to NV105;

select sys_context('NHANVIEN_CTX', 'GET_PHONGBAN') from dual;
select 'MANV = ''' || sys_context('userenv', 'SESSION_USER') || '''' from dual;
select * from QLDA.THAMGIADEAN;

delete QLDA.THAMGIADEAN where DEAN='DA001';

update QLDA.THAMGIADEAN set TRANGTHAI='Đã duyệt' where MANV='NV112' and DEAN='DA001';

select * from qlda.nhanvien;

-- lấy ds user trong QLDE (NV100 ->)
select username from DBA_users where username like 'NV%' ORDER BY username;
-- hiển thị các role có trong CSDL do QLDA tạo ra
select * from Dba_roles where ROLE like 'ROLE_%';
-- lấy ds table của do QLDA sở hữu
select * from user_tab_columns;
select column_name from user_tab_columns where table_name like DEAN;

-- lấy ds table của do QLDA sở hữu
select * from user_views;


SELECT table_name, owner, tablespace_name FROM all_tables where owner like 'QLDA';
SELECT * FROM all_role;
SELECT * FROM all_tables where owner like 'QLDA';
SELECT object_id, object_name FROM USER_OBJECTS where object_type like 'TABLE';
SELECT view_name FROM all_views;

select * from QLDA.NHANVIEN;
grant Select(MAPHONG) ON PHONGBAN to ROLE_GIAMDOC;
GRANT update(MAPHONG) ON PHONGBAN TO ROLE_GIAMDOC;

grant  ROLE_TRUONG_PHONG to nv106;
grant  ROLE_TRUONG_PHONG to nv111;
