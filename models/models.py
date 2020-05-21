from PORTFOLIO.database import db
from sqlalchemy.orm import relationship
from copy import copy


class Login(db.Model):
    __tablename__ = 'login'

    id = db.Column(db.Integer, primary_key=True)
    login_name = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(50), nullable=False)
    users = db.relationship("User", uselist=False, backref="login")
    follow = db.relationship("Follow", uselist=False, backref="login")


class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    address = db.Column(db.String(255), nullable=False)
    number = db.Column(db.String(20), nullable=False)
    login_id = db.Column(db.Integer, db.ForeignKey('login.id'), nullable=False)
    
    profile = db.relationship('Profile',uselist=False, backref="users")
    tweets = db.relationship('Tweet',backref= "users")
    follow = db.relationship('Follow', backref ="users")

    
    
            
class Tweet(db.Model):
    __tablename__ = 'tweets'

    id = db.Column(db.Integer, primary_key=True)
    word = db.Column(db.String(300), nullable=True)
    photo = db.Column(db.String(900), nullable=True) 
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    
    user = db.relationship('User', backref=db.backref("users", lazy =True)) #add
    reply = db.relationship('Reply',backref="tweet")    # replyを１つだけ表示のため
    
    #add
    good_count = db.Column(db.Integer, default=0)
    good = False

    Good = db.relationship("Good",backref="tweets")


class Reply(db.Model):
    __tablename__ = 'replys'

    id = db.Column(db.Integer, primary_key=True)
    comment = db.Column(db.String(300), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    tweet_id = db.Column(db.Integer, db.ForeignKey('tweets.id'),nullable=False)
    user = db.relationship('User',uselist=False, backref="replys")
    
 
class Profile(db.Model):
    __tablename__ = 'profiles'

    id = db.Column(db.Integer,primary_key=True)
    avatar = db.Column(db.String(900), nullable=True)
    bio = db.Column(db.String(500), nullable=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    user = db.relationship('User', backref="profiles")


class Good(db.Model):
    __tablename__ = 'good'

    id=db.Column(db.Integer,primary_key=True)
    color =db.Column(db.String(50),nullable=True)
    tweet_id = db.Column(db.Integer,db.ForeignKey('tweets.id'), nullable=False)
    tweet = db.relationship("Tweet",backref="good")
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)

   
class Follow(db.Model):
    __tablename__ = 'follow'

    id= db.Column(db.Integer,primary_key=True)
    source_user_id = db.Column(db.Integer,db.ForeignKey('login.id'),nullable=False)
    target_user_id = db.Column(db.Integer,db.ForeignKey('users.id'),nullable=False)
