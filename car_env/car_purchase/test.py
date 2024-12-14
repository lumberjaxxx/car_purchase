import sys, os
myPath = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, myPath + '/../')

import unittest
import warnings
from api import app


class APITests(unittest.TestCase):
    def setUp(self):
        app.config["TESTING"] = True
        self.app = app.test_client()

        warnings.simplefilter("ignore", category=DeprecationWarning)

    def test_index_page(self):
        response = self.app.get("/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), '{"message":"Cars Available on Purchase"}\n')

    def test_get_client(self):
        response = self.app.get("/clients")
        self.assertEqual(response.status_code, 200)
        self.assertTrue("Rex" in response.data.decode())


if __name__ == "__main__":
    unittest.main()