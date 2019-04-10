set serveroutput on
create or replace trigger borrar_emp after delete on empleado
begin
	dbms_output.put_line('Se va a borrar un empleado');
end;
/