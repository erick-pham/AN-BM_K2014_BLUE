--Xem nhân viên chung phòng với nhân viên đã login
--CREATE VIEW V_NHANVIEN_OF_USER AS SELECT * FROM HCMUS.NHANVIEN;
create or replace function FUNC_SELECT_TABLE_NV(object_schema in varchar2, object_name in varchar2)
return varchar2
as
  PHONGBAN varchar2(5);
  TEMP varchar2(100);
begin
    -- xét tuần khối lượng kết quả trả về
	-- nếu session thuộc phòng nhân sự hoặc làm giám đốc thì cho xem toàn bộ bảng,
	if sys_context('userenv', 'SESSION_USER') = 'SYSTEM'
		or sys_context('userenv', 'SESSION_USER') = 'QLDA'
		or sys_context('userenv', 'ISDBA') = 'TRUE'
		or sys_context('NHANVIEN_CTX', 'GET_PHONGBAN') = 'PB001'
		or sys_context('NHANVIEN_CTX', 'IS_GIAMDOC') = 'TRUE'
		then
			return ''; 
	end if;
	-- nếu user session là các trưởng phòng
	if sys_context('NHANVIEN_CTX', 'IS_TRUONGPB') = 'TRUE'
		then
			PHONGBAN := sys_context('NHANVIEN_CTX', 'GET_PHONGBAN');
			TEMP :=  'MAPHONG = ''' || PHONGBAN || '''';
		return TEMP;
	end if;
    
    -- trường hợp cuối trả về chính mình
	return 'MANV = ''' || sys_context('userenv', 'SESSION_USER') || '''';
end;


begin dbms_rls.add_policy(
	object_schema => 'QLDA',
	object_name => 'NHANVIEN',
    policy_name => 'POLICY_SELECT_TABLE_NV',
    function_schema => 'QLDA',
    policy_function => 'FUNC_SELECT_TABLE_NV',
	statement_types => 'select');
end;

--drop POLICY_SELECT_TABLE_NV
/*
begin dbms_rls.drop_policy(
	object_schema => 'QLDA',
	object_name => 'NHANVIEN',
	policy_name => 'POLICY_SELECT_TABLE_NV'); 
end;
*/


--===============================================================----------
--===============================================================----------
--===============================================================----------
--===============================================================----------
--===============================================================----------
create or replace function FUNC_UPDATE_TABLE_NV(object_schema in varchar2, object_name in varchar2)
return varchar2
as
  TEMP varchar2(100);
  SL NUMBER;
  IJ NUMBER;
begin
    -- xét từng khối lượng kết quả trả về
	-- nếu session là DBA thì cho phép toàn bộ
	if sys_context('userenv', 'SESSION_USER') = 'SYSTEM'
		or sys_context('userenv', 'SESSION_USER') = 'QLDA'
		or sys_context('userenv', 'ISDBA') = 'TRUE'
		then
			return ''; 
	end if;
    
    -- nếu session là nhân viên phòng nhân sự (ko dc update các trưởng phòng)
    if sys_context('NHANVIEN_CTX', 'GET_PHONGBAN') = 'PB001' and sys_context('NHANVIEN_CTX', 'IS_TRUONGPB') = 'FALSE' and sys_context('NHANVIEN_CTX', 'IS_GIAMDOC') = 'FLASE'
        then 
            TEMP :='';
            IJ :=0;
            begin
                select COUNT(*) INTO SL from QLDA.PHONGBAN;
                for MATP_LIST in (select TRUONGPHONG from QLDA.PHONGBAN)
                loop
                    IJ:=IJ+1;
                    IF(IJ=SL) THEN
                    TEMP := TEMP || '''' ||MATP_LIST.TRUONGPHONG || '''';
                    ELSE TEMP := TEMP || '''' ||MATP_LIST.TRUONGPHONG || ''',';
                    END IF;
                end loop;
            end;
            return 'MANV NOT IN (' ||TEMP || ')';
    end if;
    -- giám đốc được update nhân viên thuộc cùng phòng với mình
     if sys_context('NHANVIEN_CTX', 'IS_GIAMDOC') = 'TRUE'
        then return 'MAPHONG = ''' || sys_context('userenv', 'GET_PHONGBAN') || '''';
    end if;
    
    -- trường hợp cuối update chính mình
	return 'MANV = ''' || sys_context('userenv', 'SESSION_USER') || '''';
end;

begin dbms_rls.add_policy(
	object_schema => 'QLDA',
	object_name => 'NHANVIEN',
    policy_name => 'POLICY_UPDATE_TABLE_NV',
    function_schema => 'QLDA',
    policy_function => 'FUNC_UPDATE_TABLE_NV',
	statement_types => 'UPDATE');
end;

--drop FUNC_UPDATE_TABLE_NV
/*
begin dbms_rls.drop_policy(
	object_schema => 'QLDA',
	object_name => 'NHANVIEN',
	policy_name => 'POLICY_UPDATE_TABLE_NV'); 
end;
*/