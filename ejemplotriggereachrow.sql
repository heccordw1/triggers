set serveroutput on
create or replace trigger borrar_emp after delete on empleado for each row
begin
	dbms_output.put_line('Se va a borrar al empleado '||:old.nombre);
end;
/