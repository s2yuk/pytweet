#initialization to use SQLAlchemy in Flask applicarion
from flask_sqlalchemy import SQLAlchemy 
from flask_migrate import Migrate 

#creating an object of class SQLAlchemy, SQLAlchemy=or map ,as a tool ,to connect python and mysql ,
# have a lot of command but this time we use flask_sqlalchemy specify 
db = SQLAlchemy()

            #app = application 
def init_db(app):
    db.init_app(app)
    Migrate(app,db)

    return db
