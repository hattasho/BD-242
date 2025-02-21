import mysql.connector
from mysql.connector import Error

def create_connection():
    """Cria uma conexão com o banco de dados MySQL."""
    connection = None
    try:
        connection = mysql.connector.connect(
            host='localhost',
            port='3306',
            user='root',
            password='root',
            database='BD_AVIOES'
        )
        print("Conexão com o MySQL bem-sucedida")
    except Error as e:
        print(f"Erro '{e}' ocorreu")

    return connection

def create_cliente(connection, nome, email):
    cursor = connection.cursor()
    query = "INSERT INTO TB_CLIENTES (nome, email) VALUES (%s, %s)"
    cursor.execute(query, (nome, email))
    connection.commit()
    print("Cliente adicionado.")

def read_clientes(connection):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM TB_CLIENTES")
    clientes = cursor.fetchall()
    for cliente in clientes:
        print(cliente)

def update_cliente(connection, cliente_id, nome, email):
    cursor = connection.cursor()
    query = "UPDATE TB_CLIENTES SET nome = %s, email = %s WHERE id = %s"
    cursor.execute(query, (nome, email, cliente_id))
    connection.commit()
    print("Cliente atualizado.")

def delete_cliente(connection, cliente_id):
    cursor = connection.cursor()
    query = "DELETE FROM TB_CLIENTES WHERE id = %s"
    cursor.execute(query, (cliente_id,))
    connection.commit()
    print("Cliente deletado.")

def main():
    connection = create_connection()
    if connection is None:
        return

    # Exemplo de uso das funções CRUD
    create_cliente(connection, 'Saul Ramos', 'saul.ramos07@aluno.edu.br')
    read_clientes(connection)
    update_cliente(connection, 1, 'Saul Ramos', 'saul.ramos07@aluno.aluno.edu.br')
    read_clientes(connection)
    delete_cliente(connection, 1)
    read_clientes(connection)

    connection.close()

if __name__ == "__main__":
    main()