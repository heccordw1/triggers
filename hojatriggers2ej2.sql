--Escribir un trigge rque impida borrar una provincia de la tabla tprovincia si hay clientes en ella--
create or replace trigger impedirborrado before delete on tprovincia for each row
declare
	cont 	number(3);
begin
	select count(*) into cont from tcliente where provincia=:old.codigo;
	if(cont>0) then
		raise_application_error (-20045,'Error: no se puede borrar una provincia para la que existen clientes');
	end if;
end;
/