import uuid
from fastapi import Depends, FastAPI, HTTPException 
from database import engine, get_db  
from sqlalchemy.orm import Session
from pydantic_schemas.customer_create import CustomerCreate
from models.base import Base
from models.user import User


app = FastAPI()

@app.get('/')
def root():
    return {'message': 'Welcome to MTC'}

@app.post('/add-customer')
def add_customer(customer: CustomerCreate, db: Session = Depends(get_db)):
    
    user_db = db.query(User).filter(User.name == customer.name).first()

    if user_db:
        raise HTTPException(400, 'User with same name already exist in db')

    user_db = User(id=str(uuid.uuid4()), name = customer.name, phone = customer.phone, address = customer.address)

    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    
    return user_db


Base.metadata.create_all(engine)