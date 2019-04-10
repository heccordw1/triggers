set serveroutput on
create or replace trigger auditar after insert or delete on empleado for each row
begin
	if inserting then
		insert into auditarempleado values(to_char(sysdate, 'dd/mm/yyyy--hh24:mi')||' '||:new.num_emp||' '||:new.nombre||'; INSERCION');
	end if;
	if deleting then
		insert into auditarempleado values(to_char(sysdate, 'dd/mm/yyyy--hh24:mi')||' '||:old.num_emp||' '||:old.nombre||'; BORRADO');
	end if;
end;
/