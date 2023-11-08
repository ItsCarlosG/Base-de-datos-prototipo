
create database citas_medicas;
use citas_medicas; 
CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo_electronico VARCHAR(255),
    contraseña VARCHAR(60),
    esta_activo BOOLEAN NOT NULL DEFAULT 1,
    es_administrador BOOLEAN NOT NULL DEFAULT 0,
    creado_en DATETIME
);

CREATE TABLE paciente (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_historia VARCHAR(50),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    genero VARCHAR(1),
    fecha_nacimiento DATE,
    correo_electronico VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(255),
    imagen VARCHAR(255),
    enfermedades VARCHAR(500),
    medicamentos VARCHAR(500),
    alergias VARCHAR(500),
    esta_activo BOOLEAN NOT NULL DEFAULT 1,
    creado_en DATETIME
);
CREATE TABLE categoria (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200)
);
CREATE TABLE medico (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    no_medico VARCHAR(50),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    genero VARCHAR(1),
    fecha_nacimiento DATE,
    correo_electronico VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(255),
    imagen VARCHAR(255),
    esta_activo BOOLEAN NOT NULL DEFAULT 1,
    creado_en DATETIME,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);
CREATE TABLE estado (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE reservacion (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    nota TEXT,
    mensaje TEXT,
    fecha_hora VARCHAR(50),
    hora VARCHAR(50),
    creado_en DATETIME,
    paciente_id INT,
    sintomas TEXT,
    enfermedades TEXT,
    medicamentos TEXT,
    usuario_id INT,
    medico_id INT,
    es_web BOOLEAN NOT NULL DEFAULT 0,
    estado_id INT NOT NULL DEFAULT 1,
    FOREIGN KEY (estado_id) REFERENCES estado(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    FOREIGN KEY (medico_id) REFERENCES medico(id)
);

