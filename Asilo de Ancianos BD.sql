DROP DATABASE IF EXISTS Proyecto;
CREATE DATABASE Proyecto;
USE Proyecto;

			CREATE TABLE Medico(
					id_Medico int primary key not null auto_increment,
					Nombre varchar (40),
					Apellidos varchar (40),
					Fecha_De_Nacimiento date,
					Turno varchar (40),
					Especialidad varchar (40));
	
			CREATE TABLE Receta (
					id_Receta int primary key not null auto_increment,
					Nombre_De_Medicamento varchar (40),
					Tamaño int ,
					Formato varchar (40),
					Caducidad date,
					Dosis varchar (40));

			CREATE TABLE Puesto(
					id_Puesto int primary key not null auto_increment,
					Nombre varchar (40));
	
			CREATE TABLE Empleado (
					id_Empleado int primary key not null auto_increment ,
					id_Puestoa int, 
					Nombre varchar(40),
					Apellidos varchar(40),
					Fecha_De_Nacimiento date,
				Constraint  Foreign Key (id_Puestoa) references Puesto(id_Puesto)
                );
	
			CREATE TABLE Usuario (
					id_usuario int primary key not null auto_increment,
					Nombre varchar(40),
					Pass varchar(40)				
                );
	
			CREATE TABLE Familiar(
					id_Familiar int primary key not null auto_increment,
					Nombre varchar(40),
					Apellidos varchar(40),
					Telefono int not null, 
					Email varchar(40));
	

			CREATE TABLE Huesped (
					id_Huesped int primary key not null auto_increment,
					Nombre varchar(40),
					Apellido varchar(40),
					Fecha_De_Nacimiento date,
					Tipo_De_Sangre varchar(40),
					id_Familiar int,
				CONSTRAINT FKid_Familiar FOREIGN KEY (id_Familiar) References Familiar(id_Familiar));

			CREATE TABLE Cita_Medica(
					id_Cita int primary key not null auto_increment,
					id_Huesped int,
					Fecha date,
					Peso int,
					Altura double,
					Sintomas varchar(100),  
					Observaciones varchar(100),
					id_Receta int,
				CONSTRAINT KFid_Receta FOREIGN KEY (id_Receta) REFERENCES Receta(id_Receta),
				CONSTRAINT FKid_Huesped FOREIGN KEY (id_Huesped) REFERENCES Huesped(id_Huesped));

			CREATE TABLE Agenda_Citas(
					id_Agenda int primary key not null auto_increment,
					Fecha date,
					id_Huesped int,
					id_Medico int,
					Horario varchar (30),
				CONSTRAINT KFid_Huesped FOREIGN KEY (id_Huesped) REFERENCES Huesped(id_Huesped),
				CONSTRAINT KFid_Medico FOREIGN KEY (id_Medico) REFERENCES Medico(id_Medico));

commit;
				
		INSERT INTO Medico value (1,'Carlos','Reyes','1996-07-09','07:00 - 13:00','Medico Cirujado');
		INSERT INTO Receta    (Nombre_De_Medicamento,Tamaño,Formato,Caducidad,Dosis) Value ('Homeprazol',23,'Tabletas','2018-09-12','1 cada 8 horas');
		INSERT INTO Puesto Value (1,'Administrador');
        INSERT INTO Empleado(id_Puestoa,Nombre,Apellidos, Fecha_De_Nacimiento) Value (1,'Carlos','Reyes','1996-04-12');
		INSERT INTO Usuario(Nombre,Pass) Value ("Carlos",123);
		insert into Familiar(Nombre,Apellidos,Telefono,Email) value ('Magdalena','CarloMacno',6121503609,'Rosali@gmail.com');
		INSERT INTO Huesped(Nombre,Apellido,Fecha_De_Nacimiento,Tipo_De_Sangre,id_Familiar) Value ('Morgan','Freeman','1609-09-05','A+',1);
		INSERT INTO Cita_Medica(id_Huesped,Fecha,Peso,Altura,Sintomas,Observaciones,id_Receta) Value (1,'2018-09-11',67,1.98,'Esta muy flaco y desnutrido, deberia morir pronto','Sobre peso en la zona angular declibe clinica',1 );
		INSERT INTO Agenda_Citas(Fecha,id_Huesped,id_Medico,Horario) Values ('2018-09-14',1,1,'13:30-14:00');


	 	SELECT * FROM Receta;
		SELECT * FROM Medico;
		SELECT * FROM Puesto;
        Select * from Empleado;
		SELECT * FROM Puesto join Empleado ON Puesto.id_Puesto = Empleado.id_Puestoa;
        SELECT * FROM Usuario;
		SELECT Nombre,Pass FROM Usuario WHERE Nombre="Carlos" AND Pass = 123;
		SELECT * From Familiar;
        sELECT * FROM Huesped join Familiar ON Huesped.id_Familiar = Familiar.id_Familiar;
	 	SELECT * FROM Huesped;
	    select * from Cita_Medica;
        SELECT * FROM Cita_Medica join Huesped ON Huesped.id_Huesped = Cita_Medica.id_Cita;
	 	SELECT * FROM Agenda_Citas join Huesped join Medico ON Agenda_Citas.id_Huesped = Huesped.id_Huesped AND Agenda_Citas.id_Medico = Medico.id_Medico;
	 	SELECT * FROM Agenda_Citas;