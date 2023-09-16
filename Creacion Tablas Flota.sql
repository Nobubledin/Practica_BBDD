-- Creación del esquema

create schema flota

-- Creación de las tablas y claves primarias

create table flota.coche(
	ID_coche int primary key,
	Marca VARCHAR(15) not null,
	Modelo VARCHAR(15) not null,
	Fecha_compra date not null,
	Matrícula VARCHAR(7) not null,
	Kilometraje decimal not null,
	Color VARCHAR(15) not null
);

create  table flota.marcas (
	Nombre_marcas VARCHAR(15) primary key,
	Grupo VARCHAR(30) not null
);

create table flota.grupo (
	Grupo_Empresarial VARCHAR(30) primary key
);

create table flota.aseguradora(
	CIF VARCHAR(9) primary key,
	Razón_social VARCHAR(20) not null,
	Teléfono int not null,
	Email VARCHAR(50) not null,
	Poliza INT not null
);

create table flota.poliza(
	N_poliza int primary key,
	Precio_póliza decimal not null,
	Fecha_alta date not null,
	Moneda VARCHAR(15) not null,
	Coche int not null
);

create table flota.revision (
	ID_revisión int primary key,
	Kms_actuales decimal not null,
	Importe decimal not null,
	Moneda VARCHAR(15) not null,
	Coche int not null
);

create table flota.moneda (
	Nombre_moneda VARCHAR(15) primary key
);

-- Crear las relaciones

alter table flota.revision add constraint pk_coche_revision foreign key (Coche) references flota.coche(ID_coche);
alter table flota.revision add constraint pk_moneda_revision foreign key (Moneda) references flota.moneda(Nombre_moneda);
alter table flota.coche add constraint pk_marcas_coche foreign key (Marca) references flota.marcas (Nombre_marcas);
alter table flota.marcas add constraint pk_grupo_marcas foreign key (Grupo) references flota.grupo (Grupo_Empresarial);
alter table flota.poliza add constraint pk_coche_poliza foreign key (Coche) references flota.coche (ID_coche);
alter table flota.poliza add constraint pk_moneda_poliza foreign key (Moneda) references flota.moneda (Nombre_moneda);
alter table flota.aseguradora add constraint pk_poliza_aseguradora foreign key (Poliza) references flota.poliza (N_Poliza);

select Modelo, Marca, fecha_compra, matrícula, color, kilometraje from flota.coche;
select Razón_social, Poliza from flota.aseguradora;
