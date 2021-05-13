create or replace function fn_getCodeNm(vdept COMTCCMMNCODE.CODE_ID%type)
    return COMTCCMMNCODE.CODE_ID_NM%type
is
    code_nm COMTCCMMNCODE.CODE_ID_NM%type;
begin
    select COMTCCMMNCODE.CODE_ID_NM into code_nm 
    from COMTCCMMNCODE
    where CODE_ID = vdept;
    return code_nm;
end;

