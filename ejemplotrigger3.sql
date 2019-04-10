set serveroutput on
create or replace trigger mod_in_cli after insert or update of nombre, provincia on tcliente
begin
	if inserting then
		dbms_output.put_line('Se ha insertado un cliente');
	end if;
	if updating ('nombre') then
		dbms_output.put_line('Se ha modificado el nombre de un cliente');
	end if;
	if updating ('provincia') then
		dbms_output.put_line('Se ha modificado la provincia de un cliente');
	end if;
end;
/