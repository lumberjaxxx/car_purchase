# car_purchase
CSE final project - Gatchalian
# Car Purchase API

The Car Purchase API is a Flask-based RESTful API for managing the purchase of car-related items, clients, staff, and purchase records. It integrates with a MySQL database to store data related to clients, items, staff, and purchases. The API includes CRUD operations for managing these resources, JWT-based authentication, and error handling for various exceptions.

## Features

- **Client Management**: CRUD operations for managing client data (add, edit, delete, get).
- **Item Management**: CRUD operations for managing car items (add, edit, delete, get).
- **Staff Management**: CRUD operations for managing staff members (add, edit, delete, get).
- **Purchase Management**: CRUD operations for managing purchase records (add, edit, delete, get).
- **JWT Authentication**: Secured routes that require JWT for access.
- **Error Handling**: Handles errors like missing tokens, invalid headers, expired tokens, etc.

## Installation

### Prerequisites

- Python 3.x
- MySQL Server
- Flask
- Flask-JWT-Extended
- Flask-MySQLdb
- Pytest
- Pytest-cov

### Setup Instructions

1. Clone the repository:

    git clone <repository-url>
    cd car_purchase

2. Install required dependencies:

    pip install -r requirements.txt

3. Set up your MySQL database:

    - Create a MySQL database named `car_purchase`.
    - Set up the following tables: `client`, `item_status`, `staff_member`, `purchase`.

    Example SQL to create the `client` table:

    ```sql
    CREATE TABLE client (
        client_id INT AUTO_INCREMENT PRIMARY KEY,
        firstname VARCHAR(100),
        lastname VARCHAR(100),
        address TEXT,
        other_details TEXT
    );
    ```

    Repeat similar steps for other tables (`item_status`, `staff_member`, `purchase`).

4. Update the MySQL configuration in the `app.py` file with your database credentials:

    ```python
    app.config['MYSQL_HOST'] = 'localhost'
    app.config['MYSQL_USER'] = 'root'
    app.config['MYSQL_PASSWORD'] = 'ROOT'
    app.config['MYSQL_DB'] = 'car_purchase'
    ```

5. Run the Flask application:

    ```bash
    python app.py
    ```
  

    The API should be running on [http://127.0.0.1:5000](http://127.0.0.1:5000).

## Endpoints

### Authentication

- **Login**: `/login`
  - POST request to get a JWT token.

### Client Routes

- **Get Clients**: `GET /client`
  - Fetch all clients.
  
- **Add Client**: `POST /client/add`
  - Add a new client.
  
- **Edit Client**: `PUT /client/edit/<id>`
  - Edit client details.
  
- **Delete Client**: `DELETE /client/delete/<id>`
  - Delete a client.

### Item Routes

- **Get Items**: `GET /item`
  - Fetch all items.

- **Add Item**: `POST /item/add`
  - Add a new item.

- **Edit Item**: `PUT /item/edit/<item_code>`
  - Edit item details.

- **Delete Item**: `DELETE /item/delete/<item_code>`
  - Delete an item.

### Staff Routes

- **Get Staff**: `GET /staff`
  - Fetch all staff members.

- **Add Staff**: `POST /staff/add`
  - Add a new staff member.

- **Edit Staff**: `PUT /staff/edit/<staff_code>`
  - Edit staff member details.

- **Delete Staff**: `DELETE /staff/delete/<staff_code>`
  - Delete a staff member.

### Purchase Routes

- **Get Purchases**: `GET /purchase`
  - Fetch all purchase records.

- **Add Purchase**: `POST /purchase/add`
  - Add a new purchase record.

- **Edit Purchase**: `PUT /purchase/edit/<purchase_id>`
  - Edit purchase record.

- **Delete Purchase**: `DELETE /purchase/delete/<purchase_id>`
  - Delete a purchase record.

## Error Handling

The API includes the following error handlers:

- **No Authorization**: Missing authorization token in request header.
- **Invalid Authorization Header**: Incorrect format for authorization token.
- **JWT Decode Error**: Error decoding JWT token.
- **Revoked Token**: Token has been revoked.
- **Wrong Token Type**: Incorrect token type used.
- **Fresh Token Required**: Requires fresh token for certain operations.
- **User Lookup Error**: User not found.

## Development

To run the API in development mode, use:

```bash
python api.py
```
