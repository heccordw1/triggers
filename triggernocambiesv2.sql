--Crear un disparador que no permita  modificar el nombre, del número de superior o una subida de sueldo superior al 10%--
create or replace trigger nocambies2 before update of nombre,num_sup,salario on empleado for each row
declare
	str		varchar2(1000):='Error';
begin
	if updating('nombre') and updating then
		str:=str||', no se permite modificar los nombres a los empleados';
	end if;
	if updating('num_sup') then
		str:=str||', no se permite modificar los superiores a los empleados';
	end if;
	if updating ('salario') then
		if(:new.salario > :old.salario+(:old.salario*10/100)) then
			str:=str||', el salario no se puede aumentar mas del 10%';
		end if;
	end if;
	if(str!='Error')then
		raise_application_error(-20376,str);
	end if;
end;
/