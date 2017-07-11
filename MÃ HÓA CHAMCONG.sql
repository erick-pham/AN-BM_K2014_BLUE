-- HASH KEY
create or replace function Hash_key(p_key IN VARCHAR2) return RAW DETERMINISTIC
IS
r_key RAW(128) := UTL_RAW.cast_to_raw(p_key);
r_HASH raw(1024);
BEGIN
	r_HASH := dbms_crypto.hash(src => r_key,typ => dbms_crypto.HASH_SH1);
	return r_HASH;
END Hash_key;


-- MÃ HÓA
create or replace function encrypt_THAMGIADEAN_CHAMCONG(p_data IN VARCHAR2,p_key IN VARCHAR2)
return RAW DETERMINISTIC
IS
r_key RAW(128) := UTL_RAW.cast_to_raw(p_key);
r_data raw(1024) := utl_raw.cast_to_raw(p_data);
r_encrypted raw(1024);
BEGIN
	r_encrypted := dbms_crypto.encrypt(src => r_data,typ => dbms_crypto.DES_CBC_PKCS5,key => r_key);
	return r_encrypted;
END encrypt_THAMGIADEAN_CHAMCONG;

--- GIẢI MÃ
create or replace function DECRYPT_THAMGIADEAN_CHAMCONG(p_data IN VARCHAR2,p_hash_key in VARCHAR2,p_key IN VARCHAR2)
return VARCHAR2 DETERMINISTIC
IS
r_key RAW(128) := UTL_RAW.cast_to_raw(p_key);
r_decrypted raw(1024);
r_HASH raw(1024);
BEGIN
	r_HASH := dbms_crypto.hash(src => r_key,typ => dbms_crypto.HASH_SH1);
	if (r_HASH = p_hash_key) then
	r_decrypted := dbms_crypto.decrypt(src => p_data,typ => dbms_crypto.DES_CBC_PKCS5,key => r_key);
	return utl_raw.cast_to_varchar2(r_decrypted);
	else
		return TO_CHAR(p_data);
	end if;
END DECRYPT_THAMGIADEAN_CHAMCONG;

-- Thêm cột hash_key vào bảng chi tiêu
alter table QLDA.THAMGIADEAN add HASH_KEY  varchar2(512);


update QLDA.THAMGIADEAN set HASH_KEY = Hash_key('password@@_NV112') where MANV = 'NV112';
update QLDA.THAMGIADEAN set HASH_KEY = Hash_key('password@@_NV113') where MANV = 'NV113';
update QLDA.THAMGIADEAN set HASH_KEY = Hash_key('password@@_NV114') where MANV = 'NV114';
update QLDA.THAMGIADEAN set HASH_KEY = Hash_key('password@@_NV115') where MANV = 'NV115';

update QLDA.THAMGIADEAN set CHAMCONG = encrypt_THAMGIADEAN_CHAMCONG('10','password@@_NV113'), TRANGTHAI = 'Hoàn thành' where MANV = 'NV113' and DEAN = 'DA001';
update QLDA.THAMGIADEAN set CHAMCONG = encrypt_THAMGIADEAN_CHAMCONG('20','password@@_NV114'), TRANGTHAI = 'Hoàn thành' where MANV = 'NV114' and DEAN = 'DA002';
update QLDA.THAMGIADEAN set CHAMCONG = encrypt_THAMGIADEAN_CHAMCONG('30','password@@_NV113'), TRANGTHAI = 'Hoàn thành' where MANV = 'NV113' and DEAN = 'DA003';

select * from THAMGIADEAN;

create or replace view XEMCHAMCONG
as
select DECRYPT_THAMGIADEAN_CHAMCONG(CHAMCONG, HASH_KEY, 'password@@_NV113') as CHAMCONG from QLDA.THAMGIADEAN;


