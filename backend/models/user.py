from models.base import Base
from sqlalchemy import TEXT, VARCHAR, Column

class User(Base):
    __tablename__ = 'customers'

    id = Column(TEXT, primary_key=True)
    name = Column(VARCHAR(100))
    phone = Column(VARCHAR(15))
    address = Column(VARCHAR(100))

