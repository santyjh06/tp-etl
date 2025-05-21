import sqlite3

# Conexión a la base de datos
conn = sqlite3.connect('mi_base.db')
cursor = conn.cursor()

def agregar_cliente(id_cliente, nombre, apellido, mail, dni, nro_tel, id_ciudad):
    cursor.execute(
        "INSERT INTO clientes (id_cliente, nombre, apellido, mail, dni, Nro_tel, id_ciudad) VALUES (?, ?, ?, ?, ?, ?, ?)",
        (id_cliente, nombre, apellido, mail, dni, nro_tel, id_ciudad)
    )
    conn.commit()
    print("Cliente agregado correctamente.")

def reporte_clientes():
    cursor.execute("SELECT id_cliente, nombre, apellido, mail, dni, Nro_tel, id_ciudad FROM clientes")
    clientes = cursor.fetchall()
    print("ID | Nombre | Apellido | Mail | DNI | Teléfono | ID Ciudad")
    print("-" * 60)
    for c in clientes:
        print(f"{c[0]} | {c[1]} | {c[2]} | {c[3]} | {c[4]} | {c[5]} | {c[6]}")

# Recolección de datos por consola
print("=== Alta de cliente ===")
id_cliente = int(input("ID de Cliente: "))
nombre = input("Nombre: ")
apellido = input("Apellido: ")
mail = input("Mail: ")
dni = int(input("DNI: "))
nro_tel = int(input("Nro de Teléfono: "))
id_ciudad = int(input("ID de Ciudad: "))

agregar_cliente(id_cliente, nombre, apellido, mail, dni, nro_tel, id_ciudad)

print("\n=== Reporte de clientes ===")
reporte_clientes()

conn.close()