--Crear un disparador que no permita  modificar el nombre, del número de superior o una subida de sueldo superior al 10%--
create or replace trigger nocambies before update of nombre,num_sup,salario on empleado for each row
declare
	fila	empleado%rowtype;
begin
	select * into fila from empleado where num_emp=:new.num_emp;
	if updating('nombre') then
		raise_application_error(-20374,'No se permite modificar los nombres a los empleados');
	end if;
	if updating('num_sup') then
		raise_application_error(-20375,'No se permite modificar los superiores a los empleados');
	end if;
	if updating ('salario') then
		if(:new.salario > :old.salario+(:old.salario*10/100)) then
			raise_application_error(-20376,'El salario no se aumentar mas del 10%');
		end if;
	end if;
end;
/