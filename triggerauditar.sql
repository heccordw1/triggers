set serveroutput on
create or replace trigger auditar after insert or delete or update on empleado for each row
declare
	str		varchar2(1000):='';
begin
	if inserting then
		insert into auditarempleado values(sysdate,:new.num_emp,:new.nombre,'INSERCION',null);
	end if;
	if deleting then
		insert into auditarempleado values(sysdate,:old.num_emp,:old.nombre,'BORRADO',null);
	end if;
	if updating then
		if updating ('num_emp') then
			str:=str||'num_emp viejo : '||:old.num_emp||', num_emp nuevo: '||:new.num_emp||'; ';
		end if;
		if updating ('nombre') then
			str:=str||'nombre viejo : '||:old.nombre||', nombre nuevo: '||:new.nombre||'; ';
		end if;
		if updating ('puesto') then
			str:=str||'puesto viejo : '||:old.puesto||', puesto nuevo: '||:new.puesto||'; ';
		end if;
		if updating ('num_sup') then
			str:=str||'num_sup viejo : '||:old.num_sup||', num_sup nuevo: '||:new.num_sup||'; ';
		end if;
		if updating ('fecha_alta') then
			str:=str||'fecha_alta vieja : '||:old.fecha_alta||', fecha_alta nueva: '||:new.fecha_alta||'; ';
		end if;
		if updating ('salario') then
			str:=str||'salario viejo : '||:old.salario||', salario nuevo: '||:new.salario||'; ';
		end if;
		if updating ('comision') then
			str:=str||'comision vieja : '||:old.comision||', comision nueva: '||:new.comision||'; ';
		end if;
		if updating ('num_dep') then
			str:=str||'num_dep viejo : '||:old.num_dep||', num_dep nuevo: '||:new.num_dep||'; ';
		end if;
		insert into auditarempleado values(sysdate,:old.num_emp,:old.nombre,'MODIFICACION',substr(rtrim(str),1,length(rtrim(str))-1));
	end if;
end;
/