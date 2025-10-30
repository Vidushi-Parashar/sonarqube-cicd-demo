import pytest
from app.main import app

@pytest.fixture
def client():
    testing_app = app
    testing_app.testing = True
    with testing_app.test_client() as client:
        yield client

def test_home(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello, World!" in response.data

