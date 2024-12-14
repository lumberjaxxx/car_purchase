from flask import Flask, make_response, jsonify, request
from flask_jwt_extended import JWTManager, create_access_token, jwt_required, get_jwt_identity, get_jwt
from flask_mysqldb import MySQL
from flask_jwt_extended.exceptions import (
    NoAuthorizationError,
    InvalidHeaderError,
    JWTDecodeError,
    RevokedTokenError,
    WrongTokenError,
    FreshTokenRequired,
    UserLookupError,
    UserClaimsVerificationError
)

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'ROOT'
app.config['MYSQL_DB'] = 'car_purchase'

#initialize db
mysql = MySQL(app)
jwt = JWTManager(app)

#initialize jwt module

#error handler
@app.errorhandler(Exception)
def handle_exception(e):
    return make_response(jsonify({"message": "An unexpected error occurred."}), 500)


@app.errorhandler(NoAuthorizationError)
def handle_no_authorization_error(e):
    return make_response(jsonify({"message": "Authorization token is missing. Please include it in the header."}), 401)


@app.errorhandler(InvalidHeaderError)
def handle_invalid_header_error(e):
    return make_response(jsonify({"message": "Invalid authorization header format. Ensure it's in the form 'Bearer <token>'."}), 401)


@app.errorhandler(JWTDecodeError)
def handle_jwt_decode_error(e):
    return make_response(jsonify({"message": "Error decoding token. The token may be malformed."}), 401)


@app.errorhandler(RevokedTokenError)
def handle_revoked_token_error(e):
    return make_response(jsonify({"message": "Token has been revoked. Please log in again."}), 401)


@app.errorhandler(WrongTokenError)
def handle_wrong_token_error(e):
    return make_response(jsonify({"message": "Wrong token type used. Ensure you're using the correct token type."}), 401)


@app.errorhandler(FreshTokenRequired)
def handle_fresh_token_required_error(e):
    return make_response(jsonify({"message": "Fresh token is required to access this resource."}), 401)


@app.errorhandler(UserLookupError)
def handle_user_lookup_error(e):
    return make_response(jsonify({"message": "User not found. Please verify your credentials."}), 404)


@app.errorhandler(UserClaimsVerificationError)
def handle_user_claims_error(e):
    return make_response(jsonify({"message": "User claims verification failed. Please contact support."}), 401)


@jwt.expired_token_loader
def expired_token_callback(jwt_header, jwt_payload):
    return make_response(
        jsonify({"message": "Token has expired, please log in again."}),
        401,
    )

@jwt_required()
def restricted_route():
    claims = get_jwt()
    if claims.get('role') != 'admin':
        return jsonify({"message": "Admins only!"}), 403
    

#-------Check Connection -----
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

check_connection()
#-----UTILITY FUNCTIONS----------

def fetch_all(query, params=()):
    """Fetch all rows from a query."""
    cursor = mysql.connection.cursor()
    cursor.execute(query, params)
    rows = cursor.fetchall()
    cursor.close()
    return rows

def execute_query(query, params=()):
    """Execute a query with parameters."""
    cursor = mysql.connection.cursor()
    cursor.execute(query, params)
    mysql.connection.commit()
    cursor.close()

def validate_request(data, required_fields):
    for field, field_type in required_fields.items():
        if field not in data:
            return False, f"{field} is required."
        if not isinstance(data[field], field_type):
            return False, f"{field} must be of type {field_type.__name__}."
    return True, None

#-------ROUTES------------
#get all info
@app.route("/")
def home():
    return make_response(
        jsonify(
            {"message":"Cars Available on Purchase"}
            ), 200
    )

#CLIENT CRUD
@app.route('/clients', methods=['GET'])
def get_clients():
    rows = fetch_all("SELECT * FROM client")
    clients = [{"Client ID": row[0], "Firstname": row[1], "Lastname": row[2], "Address": row[3], "Other Details": row[4]} for row in rows]
    return jsonify(clients)

#add new client
@app.route('/add_client', methods=["post"])
def add_client():
    data = request.json #to avoid redundancy in calling mysql
    fname = data.get("fname")
    lname = data.get("lname")
    address = data.get("address")
    other_details = data.get("details")

    if not fname or not lname or not address:
        return make_response(jsonify({"message":"Required fields not filled"}), 400)
    
    try:
        execute_query(
            "INSERT INTO client (firstname, lastname, address, other_details) VALUES (%s, %s, %s, %s)",
            (fname, lname, address, other_details)
        )
        return jsonify({"message": "Client added successfully"}), 201
    except Exception as e:
        return jsonify({"message": "Error occurred while adding client"}), 500

@app.route('/edit_client/<int:id>', methods=["PUT"])
def edit_client(id):
    data = request.json
    fname = data.get("fname", None)
    lname = data.get("lname", None)
    address = data.get("address", None)
    other_details = data.get("details", None)

    if not fname or not lname or not address:
        return jsonify({"message": "Required fields not filled"}), 400

    execute_query(
        """
        UPDATE client
        SET firstname = %s, lastname = %s, address = %s, other_details = %s
        WHERE client_id = %s
        """,
        (fname, lname, address, other_details, id)
    )

    return jsonify({"message": "Client updated successfully"}), 200


@app.route('/delete_client/<int:id>', methods=["DELETE"])
def delete_client(id):
    execute_query("DELETE FROM client WHERE client_id = %s", (id,))
    return jsonify({"message": "Client deleted successfully"}), 200

# CRUD ITEMS
@app.route('/items', methods=['GET'])
def get_items():
    rows = fetch_all("SELECT * FROM item_status")
    items = [
        {
            "Item Code": row[0],
            "Item Name": row[1],
            "Quantity Available": row[2],
            "Other Details": row[3],
        }
        for row in rows
    ]
    return jsonify(items), 200


# Add a new item
@app.route('/item', methods=["POST"])
def add_item():
    data = request.json
    item_code = data.get("item_code", None)
    item_name = data.get("item_name", None)
    quantity_available = data.get("quantity_available", None)
    other_details = data.get("other_details", None)

    if not item_code or not item_name or not quantity_available:
        return jsonify({"message": "Required fields not filled"}), 400

    cursor = mysql.connection.cursor()
    cursor.execute(
        """
        INSERT INTO item_status (item_code, item_name, _quantity_available, other_details)
        VALUES (%s, %s, %s, %s)
        """,
        (item_code, item_name, quantity_available, other_details),
    )
    mysql.connection.commit()
    cursor.close()
    return jsonify({"message": "Item added successfully"}), 201


# Edit an item
@app.route('/edit_item/<string:item_code>', methods=["PUT"])
def edit_item(item_code):
    data = request.json
    item_name = data.get("item_name", None)
    quantity_available = data.get("quantity_available", None)
    other_details = data.get("other_details", None)

    if not item_name or not quantity_available:
        return jsonify({"message": "Required fields not filled"}), 400

    cursor = mysql.connection.cursor()
    cursor.execute(
        """
        UPDATE item_status
        SET item_name = %s, _quantity_available = %s, other_details = %s
        WHERE item_code = %s
        """,
        (item_name, quantity_available, other_details, item_code),
    )
    mysql.connection.commit()
    cursor.close()
    return jsonify({"message": "Item updated successfully"}), 200


# Delete an item
@app.route('/delete_item/<string:item_code>', methods=["DELETE"])
def delete_item(item_code):
    execute_query("DELETE FROM item_status WHERE item_code = %s", (item_code,))
    return jsonify({"message": "Item deleted successfully"}), 200



#------STAFF CRUD ---------------
# Get all staff members
@app.route('/stafflist', methods=['GET'])
def get_staff():
    try:
        rows = fetch_all("SELECT * FROM staff_memberss")
        staff = [
            {
                "Staff Code": row[0],
                "First Name": row[1],
                "Last Name": row[2],
                "Other Details": row[3],
            }
            for row in rows
        ]
        return jsonify(staff), 200
    except Exception as e:
        return jsonify({"message": f"Error: {str(e)}"}), 500

# Add a new staff member
@app.route('/staff', methods=["POST"])
def add_staff():
    data = request.json
    staff_code = data.get("staff_code", None)
    first_name = data.get("first_name", None)
    last_name = data.get("last_name", None)
    other_details = data.get("other_details", None)

    if not staff_code or not first_name or not last_name:
        return jsonify({"message": "Required fields not filled"}), 400

    execute_query(
        """
        INSERT INTO staff_members (staffcode, firstname, lastname, other_details)
        VALUES (%s, %s, %s, %s)
        """,
        (staff_code, first_name, last_name, other_details)
    )
    return jsonify({"message": "Staff member added successfully"}), 201


# Edit a staff member
@app.route('/edit_staff/<string:staff_code>', methods=["PUT"])
def edit_staff(staff_code):
    data = request.json
    first_name = data.get("first_name", None)
    last_name = data.get("last_name", None)
    other_details = data.get("other_details", None)

    if not first_name or not last_name:
        return jsonify({"message": "Required fields not filled"}), 400

    execute_query(
        """
        UPDATE staff_members
        SET firstname = %s, lastname = %s, other_details = %s
        WHERE staffcode = %s
        """,
        (first_name, last_name, other_details, staff_code)
    )
    return jsonify({"message": "Staff member updated successfully"}), 200


# Delete a staff member
@app.route('/delete_staff/<string:staff_code>', methods=["DELETE"])
def delete_staff(staff_code):
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM staff_members WHERE staffcode = %s", (staff_code,))
    mysql.connection.commit()
    cursor.close()
    return jsonify({"message": "Staff member deleted successfully"}), 200

# CRUD for PURCHASE TABLE

# Get all purchases
@app.route('/purchases', methods=['GET'])
def get_purchases():
    rows = fetch_all(
        """
        SELECT 
            purchase_id, 
            date_of_purchase, 
            purchase_quantity, 
            staff_member_staff_code, 
            Client_client_id, 
            item_status_item_code, 
            other_details 
        FROM purchase
        """
    )
    purchases = [
        {
            "Purchase ID": row[0],
            "Date of Purchase": row[1],
            "Purchase Quantity": row[2],
            "Staff Code": row[3],
            "Client ID": row[4],
            "Item Code": row[5],
            "Other Details": row[6],
        }
        for row in rows
    ]
    return jsonify(purchases), 200


# Add a new purchase
@app.route('/purchase', methods=["POST"])
def add_purchase():
    data = request.json
    date_of_purchase = data.get("date_of_purchase", None)
    purchase_quantity = data.get("purchase_quantity", None)
    staff_code = data.get("staff_member_staff_code", None)
    client_id = data.get("Client_client_id", None)
    item_code = data.get("item_status_item_code", None)
    other_details = data.get("other_details", None)

    if not date_of_purchase or not purchase_quantity or not staff_code or not client_id or not item_code:
        return jsonify({"message": "Required fields not filled"}), 400

    execute_query(
        """
        INSERT INTO purchase (date_of_purchase, purchase_quantity, staff_member_staff_code, Client_client_id, item_status_item_code, other_details)
        VALUES (%s, %s, %s, %s, %s, %s)
        """,
        (date_of_purchase, purchase_quantity, staff_code, client_id, item_code, other_details)
    )
    return jsonify({"message": "Purchase record added successfully"}), 201


# Edit a purchase record
@app.route('/edit_purchase/<int:purchase_id>', methods=["PUT"])
def edit_purchase(purchase_id):
    data = request.json
    date_of_purchase = data.get("date_of_purchase", None)
    purchase_quantity = data.get("purchase_quantity", None)
    staff_code = data.get("staff_member_staff_code", None)
    client_id = data.get("Client_client_id", None)
    item_code = data.get("item_status_item_code", None)
    other_details = data.get("other_details", None)

    if not date_of_purchase or not purchase_quantity or not staff_code or not client_id or not item_code:
        return jsonify({"message": "Required fields not filled"}), 400

    execute_query(
        """
        UPDATE purchase
        SET 
            date_of_purchase = %s, 
            purchase_quantity = %s, 
            staff_member_staff_code = %s, 
            Client_client_id = %s, 
            item_status_item_code = %s, 
            other_details = %s
        WHERE purchase_id = %s
        """,
        (date_of_purchase, purchase_quantity, staff_code, client_id, item_code, other_details, purchase_id)
    )
    return jsonify({"message": "Purchase record updated successfully"}), 200


# Delete a purchase record
@app.route('/delete_purchase/<int:purchase_id>', methods=["DELETE"])
def delete_purchase(purchase_id):
    execute_query("DELETE FROM purchase WHERE purchase_id = %s", (purchase_id,))
    return jsonify({"message": "Purchase record deleted successfully"}), 200


if __name__ == '__main__':
    app.run(debug=True)