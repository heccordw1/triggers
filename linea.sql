create table linea(
	num_ped		varchar2(7),
	num_lin		number(2),
	fecha_par	date,
	fecha_des	date,
	carga		number(4),
	cod_ruta	number(8),
	mat_rem		varchar2(7),			
	CONSTRAINT cp_linea PRIMARY KEY (num_ped, mun_lin),
	CONSTRAINT ca_linea_pedido FOREIGN KEY (num_ped) REFERENCES pedido (num_ped),
	CONSTRAINT ca_linea_ruta FOREIGN KEY (cod_ruta) REFERENCES ruta (cod_ruta),
	CONSTRAINT ca_linea_remolque FOREIGN KEY (mat_rem) REFERENCES remolque (mat_rem)
)
/
