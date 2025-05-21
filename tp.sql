-- tabla maestra (estas 4 tablas estan en cadena)
CREATE TABLE pais (
    id_pais INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE provincia (
    id_provincia INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE ciudad (
    id_ciudad INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    mail VARCHAR(30),
    dni INT,
    Nro_tel INT,
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)

);

-- nueva tabla dimensional estas 3 tablas pertenecen a consumos
CREATE TABLE dim_cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    mail VARCHAR(100),
    dni INT,
    Nro_tel INT,
    id_ciudad INT,
    id_provincia INT,
    id_pais INT
);

CREATE TABLE dim_servicio (
    id_servicio INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

CREATE TABLE dim_tiempo (
    id_tiempo INT PRIMARY KEY,
    fecha DATE,
    anio INT,
    mes INT,
    dia INT
);
-- aca los uno y hago las referencias de las 3 tablas de arriba
        CREATE TABLE consumos (
    id_consumo INT PRIMARY KEY,
    id_cliente INT,
    id_servicio INT,
    id_tiempo INT,
    monto DECIMAL(10),
    tipo_plan VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES dim_cliente(id_cliente),
    FOREIGN KEY (id_servicio) REFERENCES dim_servicio(id_servicio),
    FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo)
);