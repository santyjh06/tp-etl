import sqlite3

conn = sqlite3.connect('mi_base.db')
cursor = conn.cursor()

with open('tp.sql', 'r', encoding='utf-8') as f:
    sql_script = f.read()

cursor.executescript(sql_script)
conn.commit()
conn.close()

print("¡Tablas creadas correctamente en mi_base.db!")