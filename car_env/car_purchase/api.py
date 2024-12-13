from flask import Flask, make_response, jsonify, request
from flask_mysqldb import MySQL
import os

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'ROOT'
app.config['MYSQL_DB'] = 'car_purchase'

#initialize db
mysql = MySQL(app)


#get all info
@app.route("/")
def home():
    return make_response(
        jsonify(
            {"message":"<p>Hello, World!</p>"}
            ), 200
    )

#display items
@app.route('/clients', methods=['GET'])
def get_clients():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM client")
    rows = cursor.fetchall()
    cursor.close()
    client = [{"Client ID": row[0], "firstname": row[1], "lastname": row[2], "address": row[3], "other_details": row[4]} for row in rows]
    return jsonify(client)

#add new client
@app.route('/add_client', methods=["post"])
def register():
    fname = request.json.get("fname", None)
    lname = request.json.get("lname", None)
    address = request.json.get("address", None)
    other_details = request.json.get("details", None)

    if not fname or not lname or not address:
        return make_response(jsonify({"message":"Required fields not filled"}), 400)
    
    cursor = mysql.connection.cursor()
    cursor.execute("insert into (firstname, lastname, address, other_details) VALUES (%s, %s, %s, %s)", (fname, lname, address, other_details))
    mysql.connection.commit()
    cursor.close
    return jsonify({"message":"Client added Successfully"}), 201







if __name__ == '__main__':
    app.run(debug=True)