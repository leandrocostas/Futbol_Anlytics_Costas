DROP DATABASE IF EXISTS futbol_analytics;        
CREATE DATABASE futbol_analytics;
USE futbol_analytics;

-- Tabla Equipos
CREATE TABLE Equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL,
    nombre_empresa VARCHAR(50),
    nombre_ciudad VARCHAR(50),
    fecha_fundacion DATE
);

-- Tabla Jugadores
CREATE TABLE Jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(50) NOT NULL,
    apellido_jugador VARCHAR(50) NOT NULL,
    posicion VARCHAR(50),
    edad INT,
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

-- Tabla Partidos
CREATE TABLE Partidos (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_partido DATE NOT NULL,
    equipo_local INT,
    equipo_visitante INT,
    resultado VARCHAR(10),
    FOREIGN KEY (equipo_local) REFERENCES Equipos(id_equipo),
    FOREIGN KEY (equipo_visitante) REFERENCES Equipos(id_equipo)
);

-- Tabla Estadisticas_Jugadores
CREATE TABLE Estadisticas_Jugadores (
    id_estadistica INT AUTO_INCREMENT PRIMARY KEY,
    id_partido INT,
    id_jugador INT,
    goles INT,
    asistencias INT,
    faltas_cometidas INT,
    faltas_recibidas INT,
    minutos_jugados INT,
    FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido),
    FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador)
);

-- Tabla Estadisticas_Equipos
CREATE TABLE Estadisticas_Equipos (
    id_estadistica_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_partido INT,
    id_equipo INT,
    posesion_pelota FLOAT,
    tiros_arco INT,
    faltas_cometidas INT,
    tiros_esquina INT,
    tarjetas_amarilla INT,
    tarjetas_rojas INT,
    FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido),
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);
