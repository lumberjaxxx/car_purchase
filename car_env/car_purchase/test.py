import sys, os
# myPath = os.path.dirname(os.path.abspath(__file__))
# sys.path.insert(0, myPath + '/../')

import unittest
import warnings
from api import app


class APITests(unittest.TestCase):
    def setUp(self):
        app.config["TESTING"] = True
        self.app = app.test_client()

        warnings.simplefilter("ignore", category=DeprecationWarning)
#Testing homepage
    def test_index_page(self):
        response = self.app.get("/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), '{"message":"Cars Available on Purchase"}\n')
#Test get client
    def test_get_client(self):
        response = self.app.get("/client")
        self.assertEqual(response.status_code, 200)
        self.assertTrue("Samantha" in response.data.decode())

#Test Adding a Client
    def test_add_client(self):
        payload = {
            "firstname": "John",
            "lastname": "Doe",
            "address": "123 Elm Street",
            "details": "Preferred customer"
        }
        response = self.app.post("/client/add", json=payload)
        self.assertEqual(response.status_code, 201)
        self.assertIn("Client added successfully", response.data.decode())

# Test Validation for Adding a Client
    def test_add_client_missing_fields(self):
        payload = {
            "firstname": "John",
            "lastname": "Doe"
        }
        response = self.app.post("/client/add", json=payload)
        self.assertEqual(response.status_code, 400)
        self.assertIn("Required fields not filled", response.data.decode())

#  Test Retrieving All Clients
    def test_get_clients(self):
        response = self.app.get("/client")
        self.assertEqual(response.status_code, 200)
        self.assertIsInstance(response.get_json(), list) 
        self.assertTrue(any("Client ID" in client for client in response.get_json()))

# Test Retrieving a Single Client
    def test_get_client_by_id(self):
        response = self.app.get("/client/add")
        self.assertEqual(response.status_code, 200)
        self.assertIn("firstname", response.data.decode())

# Test Updating a Client
    def test_update_client(self):
        payload = {
            "firstname": "Jane",
            "lastname": "Smith",
            "address": "456 Oak Street",
            "details": "Updated customer"
        }
        response = self.app.put("/client/edit/1", json=payload)
        self.assertEqual(response.status_code, 200)
        self.assertIn("Client updated successfully", response.data.decode())

# Test Deleting a Client
    def test_delete_client(self):
        response = self.app.delete("/client/delete/50")
        self.assertEqual(response.status_code, 200)
        self.assertIn("Client deleted successfully", response.data.decode())





# #---------------purchase---------------
# Test Adding a Purchase
    def test_add_purchase(self):
        payload = {
            "staff_code":12,
            "client_id": 1,
            "car_id": 101,
            "date_of_purchase": "Tue, 14 Dec 2024 00:00:00 GMT",
            "purchase_quantity": 50000,
            "item_code":21
        }
        response = self.app.post("/purchase/add", json=payload)
        self.assertEqual(response.status_code, 201)
        self.assertIn('{"message":"Purchase record added successfully"}\n', response.data.decode())

#  Test Validation for Adding a Purchase
    def test_add_purchase_invalid_date(self):
        payload = {
            "client_id": 5,
            "car_id": 101,
            "date_of_purchase": "Invalid Date",
            "amount": 200,
            "purchase_quantity": 50000,
            "item_code":21,
            "staff_code":13
        }
        response = self.app.post("/purchase/add", json=payload)
        self.assertEqual(response.status_code, 400)
        response_json = response.get_json()
        self.assertEqual(response_json["message"], "Invalid date format. Expected 'Fri, 30 Aug 2024 00:00:00 GMT'")

#  Test Retrieving Purchases
    def test_get_purchases(self):
        response = self.app.get("/purchase")
        self.assertEqual(response.status_code, 200)
        self.assertIsInstance(response.get_json(), list) 
        self.assertTrue(any("Purchase ID" in purchase for purchase in response.get_json()))

#---------------STAFF------------------------------
    
    def test_get_staff(self):
        response = self.app.get("/staff")
        self.assertEqual(response.status_code, 200)
        self.assertIsInstance(response.get_json(), list) 
        self.assertTrue(any("Staff Code" in staff_member for staff_member in response.get_json()))

# Test Adding a Staff Member
    def test_add_staff(self):
        payload = {
            "first_name": "Alice",
            "last_name": "Johnson",
        }
        response = self.app.post("/staff/add", json=payload)
        self.assertEqual(response.status_code, 201)
        print(response.data.decode())
        response_json = response.get_json()
        self.assertIn(response_json["message"],"Staff member added successfully", response.data.decode())

# Test Adding a Staff Member with Missing Fields
    def test_add_staff_missing_fields(self):
        payload = {
            "Staff Code":13,
            "firstname": "Alice",
            "lastname": "Johnson"
        }
        response = self.app.post("/staff/add", json=payload)
        self.assertEqual(response.status_code, 400)
        response_json = response.get_json()
        self.assertIn(response_json["message"],"Required fields not filled", response.data.decode())

# Test Retrieving All Staff
    def test_get_all_staff(self):
        response = self.app.get("/staff")
        self.assertEqual(response.status_code, 200)
        self.assertIsInstance(response.get_json(), list)
        self.assertTrue(any("Staff Code" in staff for staff in response.get_json()))

# Test Retrieving a Single Staff Member
    def test_get_staff_by_id(self):
        response = self.app.get("/staff")
        self.assertEqual(response.status_code, 200)
        self.assertTrue("Alice" in response.data.decode())

# # Test Updating a Staff Member
    def test_update_staff(self):
        payload = {
            "first_name": "Alice Updated",
            "last_name": "Johnson",
        }
        response = self.app.put("/staff/edit/20", json=payload)
        print(f"Payload received: {response.json}")
        self.assertEqual(response.status_code, 200)
        response_json = response.get_json()
        self.assertIn(response_json["message"],"Staff member updated successfully", response.data.decode())

# Test Deleting a Staff Member
    def test_delete_staff(self):
        response = self.app.delete("/staff/delete/26")
        self.assertEqual(response.status_code, 200)
        response_json = response.get_json()
        self.assertIn(response_json["message"],"Staff member deleted successfully", response.data.decode())



#---------ITEMS---------------
    def test_get_item(self):
        response = self.app.get("/item")
        self.assertEqual(response.status_code, 200)
        self.assertIsInstance(response.get_json(), list) 
        self.assertTrue(any("Item Code" in item_status for item_status in response.get_json()))

# Test Adding an Item
    def test_add_item(self):
        payload = {
            "item_code": 101,
            "item_name": "Brake Pad",
            "item_description": "High-performance brake pad",
            "quantity_available": 500
        }
        response = self.app.post("/item/add", json=payload)
        self.assertEqual(response.status_code, 201)
        response_json = response.get_json()
        self.assertIn(response_json["message"],"Item added successfully", response.data.decode())

# Test Adding an Item with Missing Fields
    def test_add_item_missing_fields(self):
        payload = {
            "item_code": 101,
            "item_name": "Brake Pad"
        }
        response = self.app.post("/item/add", json=payload)
        self.assertEqual(response.status_code, 400)
        self.assertIn("Required fields not filled", response.data.decode())

# Test Retrieving All Items
    def test_get_items(self):
        response = self.app.get("/item")
        self.assertEqual(response.status_code, 200)
        self.assertIsInstance(response.get_json(), list)
        self.assertTrue(any("Item Code" in item for item in response.get_json()))

# Test Updating an Item
    def test_update_item(self):
        payload = {
            "item_name": "Brake Pad Updated",
            "item_description": "Updated description",
            "quantity_available": 450
        }
        response = self.app.put("/item/edit/20", json=payload)
        self.assertEqual(response.status_code, 200)
        response_json = response.get_json()
        self.assertIn(response_json["message"],"Item updated successfully", response.data.decode())

# Test Deleting an Item
    def test_delete_item(self):
        response = self.app.delete("/item/delete/101")
        self.assertEqual(response.status_code, 200)
        response_json = response.get_json()
        self.assertIn(response_json["message"],"Item deleted successfully", response.data.decode())




if __name__ == "__main__":
    unittest.main()