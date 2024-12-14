from faker import Faker
from flask_mysqldb import MySQL
from flask import Flask

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'ROOT'
app.config['MYSQL_DB'] = 'car_purchase'

mysql = MySQL(app)
faker = Faker()


def execute_query(query, params=()):
    """Execute a query with parameters."""
    cursor = mysql.connection.cursor()
    cursor.execute(query, params)
    mysql.connection.commit()
    cursor.close()

# Check DB connection
def check_connection():
    """Check if MySQL connection is active."""
    try:
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute("SELECT 1")
        cursor.close()
        print("Database connection is active.")
    except Exception as e:
        print(f"Error connecting to database: {e}")


def add_fake_data():
    for _ in range(25):
        fname = faker.first_name()
        lname = faker.last_name()
        address = faker.address()
        address = address[:45]
        details = faker.text(max_nb_chars=45)
        execute_query("INSERT INTO client (firstname, lastname, address, other_details) VALUES (%s, %s, %s, %s)", (fname, lname, address, details))

    for _ in range(25):
        itemname = faker.word()
        item_quantity = faker.random_int(min=1, max=100)
        details = faker.text(max_nb_chars=45)
        execute_query("INSERT INTO item_status (item_name, item_quantity_available, other_item_details) VALUES ( %s, %s, %s)", (itemname, item_quantity, details))

    for _ in range(25):
        fname = faker.first_name()
        lname = faker.last_name()
        details = faker.text(max_nb_chars=45)
        execute_query("INSERT INTO staff_member (firstname, lastname, other_details) VALUES ( %s, %s, %s)", (fname, lname, details))

    for _ in range(25):
        date = faker.date_this_year()
        quantity = faker.random_int(min=1, max=50)
        staffcode = faker.random_int(min=1, max=25)
        clientid = faker.random_int(min=1, max=50)
        itemcode = faker.random_int(min=1, max=25)
        details = faker.text(max_nb_chars=45)
        execute_query("INSERT INTO purchase (date_of_purchase, purchase_quatity, Staff_Member_staff_code, Client_client_id, Item_status_item_code, other_details) VALUES (%s, %s, %s, %s, %s, %s)", (date, quantity,staffcode, clientid, itemcode, details))

# Run the app within an application context
if __name__ == '__main__':
    with app.app_context():  # Ensure the database operations are within the Flask app context
        check_connection()  # Ensure the DB connection is active
        add_fake_data()  # Populate DB with fake data
        print("Fake data inserted successfully.")
