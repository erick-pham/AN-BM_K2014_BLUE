select * from QLDA.NHANVIEN;
select * from QLDA.PHONGBAN;
select * from QLDA.THAMGIADEAN;
select * from QLDA.DEAN;

-- lấy ds user trong QLDE (NV100 ->)
select username from DBA_users where username like 'NV%' ORDER BY username;
grant select on QLDA.Nhanvien to NV101;

-- hiển thị các role có trong CSDL do DLDE tạo ra
select * from Dba_roles where ROLE like 'ROLE%';

-- hiển thị các role mà NV101 được cấp
select * from Dba_role_privs where grantee like 'NV101';

-- hiển thị các quyền được cấp trên bảng của các role
select * from Role_tab_privs where role like 'ROLE%';

-- các user và role của họ
select * from Dba_role_privs where Dba_role_privs.grantee like 'NV%';

-- quyền mức cột của user NV101 dựa trên role
select distinct grantee,table_name,column_name,privilege from Role_tab_privs,Dba_role_privs where granted_role like ROLE and grantee like 'NV101' order by table_name,column_name,privilege ASC;

-- danh sách các role có trong hệ thống
select * from Dba_roles;


-- quyền của role trên bảng
select * from Role_tab_privs;

-- các role được gán cho user session
select * from User_role_privs;

-- quyền object của user session
select * from User_tab_privs;

-- quyền trên col của user session
select * from User_col_privs;


select * from Dba_profiles;

select * from dba_role_privs where grantee = 'NV101';


grant role_nv to NV101;

revoke role_giamdoc from nv101;

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