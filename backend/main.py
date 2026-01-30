from fastapi import FastAPI   

app = FastAPI()

@app.get('/')
def root():
    return {'message': 'Welcome to MTC'}

@app.post('/add-customer')
def add_customer():
    pass