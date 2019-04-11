--Consruir un disparador que, despues de insertsr un cliente en la tabla TCLIENTE, escriba mensajes de advertencia si el vendedor asignado no existe en la tabla TVENDEDOR o si la provincia asignada no existe en la tabla tprovincia--
set serveroutput on
create or replace trigger advertencia after insert on tcliente for each row
declare
	cont1	number(1);
	cont2	number(1);
begin
	select count(*) into cont1 from tvendedor where cod_ven=:new.vendedor;
	if(cont1=0) then
		dbms_output.put_line('El vendedor introducido no existe en su respectiva tabla');
	end if;
	select count(*) into cont2 from tprovincia where codigo=:new.provincia;
	if (cont2=0) then
		dbms_output.put_line('La provincia introducida no existe en su respectiva tabla');
	end if;
end;
/