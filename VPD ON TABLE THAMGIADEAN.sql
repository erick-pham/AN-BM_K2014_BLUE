create or replace function FUNC_SELECT_TABLE_TGDA(object_schema in varchar2, object_name in varchar2)
return varchar2
as
begin
    -- xét tuần khối lượng kết quả trả về
	-- nếu session thuộc phòng nhân sự hoặc làm giám đốc thì cho xem toàn bộ bảng,
	if sys_context('userenv', 'SESSION_USER') = 'SYSTEM'
		or sys_context('userenv', 'SESSION_USER') = 'QLDA'
		or sys_context('userenv', 'ISDBA') = 'TRUE'
		-- giám đốc được xem
		or sys_context('NHANVIEN_CTX', 'IS_GIAMDOC') = 'TRUE'
		-- nhân viên làm trưởng các phòng được xem
		or sys_context('NHANVIEN_CTX', 'IS_TRUONGPB') = 'TRUE'
		-- phòng nhân sự được xem
		or sys_context('NHANVIEN_CTX', 'GET_PHONGBAN') = 'PB001'
		-- phòng kinh doanh được xem
		or sys_context('NHANVIEN_CTX', 'GET_PHONGBAN') = 'PB004'
		then
			return ''; 
	end if;
	-- nếu session là nhân viên phòng đề án thì chỉ được xem chính mình
	if sys_context('NHANVIEN_CTX', 'GET_PHONGBAN') = 'PB003'
		then
			return 'MANV = ''' || sys_context('userenv', 'SESSION_USER') || '''';
	end if;
    -- trường hợp khác không cho xem
	return '1=0';
end;

begin dbms_rls.add_policy(
	object_schema => 'QLDA',
	object_name => 'THAMGIADEAN',
    policy_name => 'POLICY_SELECT_TABLE_TGDA',
    function_schema => 'QLDA',
    policy_function => 'FUNC_SELECT_TABLE_TGDA',
	statement_types => 'SELECT');
end;


--drop POLICY_SELECT_TABLE_TGDA
/*
begin dbms_rls.drop_policy(
	object_schema => 'QLDA',
	object_name => 'THAMGIADEAN',
	policy_name => 'POLICY_SELECT_TABLE_TGDA'); 
end;
*/

--===============================================================----------
--===============================================================----------
--===============================================================----------
--===============================================================----------
--===============================================================----------
create or replace function FUNC_DELETE_TABLE_TGDA(object_schema in varchar2, object_name in varchar2)
return varchar2
as
begin
    -- nếu session là chủ sở hữu,
	if sys_context('userenv', 'SESSION_USER') = 'SYSTEM'
		or sys_context('userenv', 'SESSION_USER') = 'QLDA'
		or sys_context('userenv', 'ISDBA') = 'TRUE'
        then return '';
    end if;
	-- nếu session là nhân viên phòng đề án thì chỉ được delete chính mình
	if sys_context('NHANVIEN_CTX', 'GET_PHONGBAN') = 'PB003'
		then
			return 'MANV = ''' || sys_context('userenv', 'SESSION_USER') || '''';
	end if;
    -- trường hợp khác không cho xóa
	return '1=0';
end;

begin dbms_rls.add_policy(
	object_schema => 'QLDA',
	object_name => 'THAMGIADEAN',
    policy_name => 'POLICY_DELETE_TABLE_TGDA',
    function_schema => 'QLDA',
    policy_function => 'FUNC_DELETE_TABLE_TGDA',
	statement_types => 'DELETE');
end;


--drop POLICY_DELETE_TABLE_TGDA
/*
begin dbms_rls.drop_policy(
	object_schema => 'QLDA',
	object_name => 'THAMGIADEAN',
	policy_name => 'POLICY_DELETE_TABLE_TGDA'); 
end;
*/
--===============================================================----------
--===============================================================----------
--===============================================================----------
--===============================================================----------
--===============================================================----------
create or replace function FUNC_INSERT_TABLE_TGDA(object_schema in varchar2, object_name in varchar2)
return varchar2
as
begin
	-- nếu session là nhân viên phòng đề án thì chỉ được INSERT chính mình
	if sys_context('NHANVIEN_CTX', 'GET_PHONGBAN') = 'PB003'
		then
			return 'MANV = ''' || sys_context('userenv', 'SESSION_USER') || '''';
	end if;
    -- trường hợp khác không cho INSERT
	return '1=0';
end;
-- không add được policy
begin dbms_rls.add_policy(
	object_schema => 'QLDA',
	object_name => 'THAMGIADEAN',
    policy_name => 'POLICY_INSERT_TABLE_TGDA',
    function_schema => 'QLDA',
    policy_function => 'FUNC_INSERT_TABLE_TGDA',
	statement_types => 'insert');
end;


--drop POLICY_DELETE_TABLE_TGDA
/*
begin dbms_rls.drop_policy(
	object_schema => 'QLDA',
	object_name => 'THAMGIADEAN',
	policy_name => 'POLICY_INSERT_TABLE_TGDA'); 
end;
*/