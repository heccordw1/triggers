--Consruir un disparador que, despues de insertsr un cliente en la tabla TCLIENTE, escriba mensajes de advertencia si el vendedor asignado no existe en la tabla TVENDEDOR o si la provincia asignada no existe en la tabla tprovincia--
set serveroutput on
create or replace trigger advertencia after insert on tcliente for each row
declare
	nven	tvendedor%rowtype;
	nprov	tprovincia%rowtype;
begin
	begin
		select * into nven from tvendedor where cod_ven=:new.vendedor;
	exception
		when no_data_found then
			dbms_output.put_line('El vendedor introducido no existe en su respectiva tabla');
	end;
	select * into nprov from tprovincia where codigo=:new.provincia;
exception
	when no_data_found then
		dbms_output.put_line('La provincia introducida no existe en su respectiva tabla');
end;
/