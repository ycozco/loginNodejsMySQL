CREATE DATABASE IF NOT EXISTS `nodelogin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `nodelogin`;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    correo_electronico VARCHAR(255) UNIQUE,
    contraseña VARCHAR(255),
    fecha_registro DATETIME,
    rol VARCHAR(50)
);

CREATE TABLE Materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_materia VARCHAR(255),
    descripcion TEXT
);

CREATE TABLE Sesiones (
    id_sesion INT AUTO_INCREMENT PRIMARY KEY,
    id_tutor INT,
    id_estudiante INT,
    id_materia INT,
    fecha_hora DATETIME,
    duración INT,
    estado VARCHAR(50),
    FOREIGN KEY (id_tutor) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_estudiante) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia)
);

CREATE TABLE Comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_sesion INT,
    id_usuario INT,
    texto TEXT,
    fecha_hora DATETIME,
    FOREIGN KEY (id_sesion) REFERENCES Sesiones(id_sesion),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Calificaciones (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_sesion INT,
    calificacion INT,
    comentarios TEXT,
    FOREIGN KEY (id_sesion) REFERENCES Sesiones(id_sesion)
);
