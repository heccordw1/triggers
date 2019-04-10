drop table auditarempleado;
create table auditarempleado (
	fec		date,
	emp		number(4),
	nom		varchar2(40),
	oper	varchar2(15),
	valores	varchar2(1000)
)
/