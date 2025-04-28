-- Creación de la base de datos
CREATE DATABASE SistemaEscolar;

-- Usar la base de datos creada
USE SistemaEscolar;

-- Tabla de Departamentos
CREATE TABLE departamento (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(100) NOT NULL
);

-- Tabla de Profesores
CREATE TABLE profesores (
    profesor_id INT PRIMARY KEY AUTO_INCREMENT,
    departamento_id INT,
    nombre_profesor VARCHAR(100) NOT NULL,
    apellido_profesor VARCHAR(100) NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamento(departamento_id)
);

-- Tabla de Direcciones
CREATE TABLE direcciones (
    direccion_id INT PRIMARY KEY AUTO_INCREMENT,
    calle VARCHAR(200) NOT NULL,
    ciudad VARCHAR(200) NOT NULL,
    provincia VARCHAR(200),
    codigo_postal VARCHAR(50)
);

-- Tabla de Estudiantes
CREATE TABLE estudiantes (
    estudiante_id INT PRIMARY KEY AUTO_INCREMENT,
    direccion_id INT,
    nombre_estudiante VARCHAR(100) NOT NULL,
    apellido_estudiante VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(100) UNIQUE,    
    FOREIGN KEY (direccion_id) REFERENCES direcciones(direccion_id)
);

-- Tabla de Cursos
CREATE TABLE cursos (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    profesor_id INT,
    departamento_id INT,
    nombre_curso VARCHAR(150) NOT NULL,
    FOREIGN KEY (profesor_id) REFERENCES profesores(profesor_id),
    FOREIGN KEY (departamento_id) REFERENCES departamento(departamento_id)
);

-- Tabla de Matrículas (relación muchos a muchos entre estudiantes y cursos)
CREATE TABLE matriculas (
    matricula_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    curso_id INT,
    fecha_matricula DATE NOT NULL,
    nota DECIMAL(3, 1),
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id),
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id),
    UNIQUE KEY estudiante_curso_unique (estudiante_id, curso_id) -- Para evitar matrículas duplicadas en el mismo curso
);