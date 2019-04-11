--Crear un trigger que impida el borrado de un empleado en fin de seamana (sabado y domingo) y que lo haga explicito al usuario que lo intenta con un mensaje adecuado--
create or replace trigger finde before delete on empleado
begin
	if(to_char(sysdate,'d')='6' or to_char(sysdate,'d')='7') then
		raise_application_error(-20047,'No se pueden borrar tuplas de la tabla empleado en fin de semana');
	end if;
end;
/