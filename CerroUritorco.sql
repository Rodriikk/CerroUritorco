create database CerroUritorco;

use CerroUritorco;



create table asuncionRiesgos
(id_asuncion_riesgo int(11) not null auto_increment primary key,
nombre varchar(150),
dni varchar(150),
fecha_asenso date,
hora_asenso time,
firma varchar(200)
);
INSERT INTO asuncionRiesgos(apellido, nombre, fecha_asenso, hora_asenso, firma)
VALUES('Agostinelli', 'Rodrigo', '2024-05-01 12:00:00', '07:50', 'Rodri');

select *
from asuncionRiesgos;

create table fichasMedicas
(id_ficha_medica int(11) not null auto_increment primary key,
alergia tinyint(1),
alergia_desc varchar(90),
diabetes tinyint(1),
diabetes_desc varchar(90),
insulinodependiente tinyint(1),
insulinodependiente_desc varchar(90),
afeccion_corazon tinyint(1),
afeccion_corazon_desc varchar(90),
asma tinyint(1),
asma_desc varchar(90),
epilepsia tinyint(1),
epilepsia_desc varchar(90),
problema_columna tinyint(1),
problema_columna_desc varchar(90),
tratamiento_medico tinyint(1),
tratamiento_medico_desc varchar(90),
medicamento tinyint(1),
medicamento_desc varchar(90),
dosis varchar(150),
observaciones varchar(150),
grupo_sanguineo varchar(30),
peso varchar(50)
);

create table clientes
(id_cliente int(11) not null auto_increment primary key,
nombre varchar(100),
apellido varchar(100),
edad int,
domicilio_real varchar(150),
alojamiento varchar(150),
dni varchar(20),
procedencia varchar(80),
nacionalidad varchar(80),
estado_civil varchar(30),
profesion varchar(80),
celular varchar(20),
telefono_familiar varchar(20),
localidad varchar(100),
id_asuncion_riesgo int not null,
id_ficha_medica int not null,
foreign key(id_asuncion_riesgo) 
references asuncionRiesgos(id_asuncion_riesgo),
foreign key(id_ficha_medica)
references fichasMedicas(id_ficha_medica)
);

create table excursiones
(id_excursion int(11) not null auto_increment primary key,
nombre_excursion varchar(70),
descripcion varchar(800)
);

create table facturas
(nro_factura int(11) not null auto_increment primary key,
fecha_venta date
);

create table detalle_facturas
(id_detalle_factura int(11) not null auto_increment primary key,
cantidad_entradas int,
precio_unitario float,
id_cliente int not null,
id_excursion int not null,
nro_factura int not null,
foreign key(id_cliente)
references clientes(id_cliente),
foreign key(id_excursion)
references excursiones(id_excursion),
foreign key(nro_factura)
references facturas(nro_factura)
);

