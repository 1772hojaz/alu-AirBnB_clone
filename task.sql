from sqlalchemy import create_engine, Column, String, Date, Table
from sqlalchemy.orm import sessionmaker, relationship
from sqlalchemy.ext.declarative import declarative_base

class Place(Base):
    __tablename__ = 'place'
    id = Column(String(250), primary_key=True)
    updated_at = Column(Date)
    created_at = Column(Date)
    name = Column(String(128), nullable=False)


    place_amenity_association = Table('place_amenity', Base.metadata,
    Column('place_id', String(250), ForeignKey('place.id'), primary_key=True),
    Column('amenity_id', String(250), ForeignKey('amenity.id'), primary_key=True)
)


engine = create_engine('mysql://hbnb_dev:hbnb_dev_pwd@localhost/hbnb_dev_db')
session = sessionmaker(bind=engine)()

Base = declarative_base()

Place.amenities = relationship("Amenity", secondary=place_amenity_association, backref="places")
class Amenity(Base):
    __tablename__ = 'amenity'
    id = Column(String(250), primary_key=True)
    updated_at = Column(Date)
    created_at = Column(Date)
    name = Column(String(128), nullable=False)

Base.metadata.create_all(engine)
