--Crear un disparador que no permita  modificar el nombre o el número de superior--
create or replace trigger nocambies before update of nombre on empleado
begin
	raise_application_error(-20374,'No se permite modificar nombres de empleado');
end;
/

	