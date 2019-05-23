accept cod prompt 'Introduce un codigo de carretera '
select *
from pedido
where exists
	(select *
	from linea 
	where pedido.num_ped=num_ped
	and not exists
		(select *
		from ruta
		where linea.cod_ruta=cod_ruta
		and exists
			(select *
			from rut_tra
			where ruta.cod_ruta=cod_ruta
			and cod_car=upper(cod_car))));
		