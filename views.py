"""
pip install Flask-Session
"""
from .database import db
from .app import app 
from flask import Flask, render_template, request, redirect, url_for, session, flash,jsonify
from .models import User, Login , Tweet, Reply , Profile, Good ,Follow #*
import os
import json 

app.config["IMAGE_UPLOADS"]='static/images'

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/signup', methods=['POST','GET'])
def signup():
    
    if request.method == 'POST':
        check = Login.query.filter_by(login_name=request.form['login_name']).first()
        print("check",check)
        if check == None :
            login = Login(login_name=request.form['login_name'], password=request.form['password'])
                
            try:
                db.session.add(login) 
                db.session.commit()  

                db.session.refresh(login) 
                print(login.id)
        
                user = User(login_id=login.id, name=request.form['name'], address=request.form['address'], number=request.form['number'])
                db.session.add(user)
                db.session.commit()

                return redirect('/login')
            except:
                return 'Error'
        else:
            return 'Sorry, login name is already use.  <br> Please change your login name. <br> <a href="/signup" class="btn btn-outline-primary">Back</a>' 
            
    else:
        return render_template('signup.html')


@app.route('/login', methods=['POST','GET'])
def login():
    if request.method == 'POST':
        login = Login.query.filter_by(
            login_name=request.form['login_name'], password=request.form['password']).first()
        
        if login:   #if True      
            session['id']=login.id      #セッションIDの設定
            return redirect('dashboard')
            
        else:  #False
            return 'Error in logging in... go back and try again!'
            
    else:
        return render_template('login.html')

#tweet function
@app.route('/dashboard', methods=['POST','GET'])  
def dashboard():
    id = session['id']

    login = Login.query.filter_by(id=id).first()
    user = User.query.filter_by(login_id=id).first()

    my_tweet = Tweet.query.filter_by(user_id=id).order_by(Tweet.id.desc()).all() #dispay my tweet
    tweet = Tweet.query.order_by(Tweet.id.desc()).all() #dispaly all user's tweet
    # print("tweet : ",tweet)
    # print("my tweet :", my_tweet)
    # print(len(my_tweet))
    reply = Reply.query.order_by(Reply.id).all()
    profile = Profile.query.filter_by(user_id=id).first() #login user's profile
  
    gooded_id_list = Good.query.filter_by(user_id = id).all() #ログインユーザーのgood.id list
    gooded_list= []
    for gooded in gooded_id_list:
        gooded_list.append(gooded.tweet_id)
    # print('gooded_list',gooded_list)
    # print('gooded_id_list :',gooded_id_list)

    #for follow
    followed_id_list = Follow.query.filter_by(source_user_id = id).all() #lodin user's follow list
    followed_list = [id] #my id + target_user_id
    for followed in followed_id_list:
        followed_list.append(followed.target_user_id)
    print("followed_list :" ,followed_list)
    
    # tweet =====================================
    if request.method == 'POST':
        
        if 'photo' not in request.files:
            tweet = Tweet(word=request.form['word'], user_id=id, photo=None)
            
            db.session.add(tweet)
            db.session.commit()
            return redirect('/dashboard')

        else:
            images = request.files['photo']
            pic_name = images.filename
            print(pic_name)
            
            images.save(os.path.join(app.config["IMAGE_UPLOADS"],images.filename))
            tweet = Tweet(word=request.form['word'], user_id=id, photo=pic_name)

            db.session.add(tweet)
            db.session.commit()

            return redirect('/dashboard')
    else:
        return render_template('dashboard.html',login=login, user=user, tweets=tweet,replys=reply,profile=profile, 
        gooded_id_list=gooded_id_list,gooded_list=gooded_list,
        followed_list=followed_list, my_tweet=my_tweet)



@app.route('/edit_tweet/<int:tweet_id>', methods=['POST','GET'])
def edit_tweet(tweet_id):
    tweet = Tweet.query.get_or_404(tweet_id)

    id = session['id']
    login = Login.query.filter_by(id=id).first()
    user = User.query.filter_by(login_id=id).first()
    profile = Profile.query.filter_by(user_id=id).first()

    if request.method == 'POST':
        
        if not 'photo' in request.files:
            tweet.word = request.form['word']
        else:
            images = request.files['photo']
            pic_name=images.filename
            images.save(os.path.join(app.config["IMAGE_UPLOADS"],images.filename))

            tweet.word=request.form['word']
            tweet.photo=pic_name
        
        try:
            db.session.commit()
            return redirect('dashboard')

        except:
            return 'edit error'
    else:
        return render_template('edit_tweet.html',tweet=tweet,login=login,user=user,profile=profile)



@app.route('/tweets/<int:id>/reply', methods=['POST'])
def new_reply(id):
    user_id = session['id']
    user = User.query.filter_by(login_id=user_id).first()
    tweet = Tweet.query.filter_by(id=id)
    
    reply = Reply(comment=request.form['comment'],
                  user_id=user_id,
                  tweet_id=id)
    try:
        db.session.add(reply)
        db.session.commit()
        return redirect('/dashboard')
    except Exception as e:
        print(e)
        return 'Reply Error '

@app.route('/tweets/<int:id>/reply_by_profile', methods=['POST'])
def reply_by_profile(id):
    login_id = session['id']
    tweet = Tweet.query.filter_by(id=id).first()
    print("tweet : ", tweet )
    target = tweet.user_id

    reply = Reply(comment=request.form['comment'],
                  user_id=login_id,
                  tweet_id=id)
    try:
        db.session.add(reply)
        db.session.commit()
        return redirect(url_for('user_profile',id=target))
    except Exception as e:
        print(e)
        return 'Reply Error '


@app.route('/update',methods=['POST','GET'])
def update_user():
    id = session['id']

    user = User.query.filter_by(login_id=id).first()
    login = Login.query.filter_by(id=id).first()

    if request.method == 'POST':
        
        user.name = request.form['name']
        user.address = request.form['address']
        user.number = request.form['number']

        try:
            db.session.commit()  
            return redirect('update')
        except:
            return 'Error in updating'
    else:
        return render_template('update.html', user=user,login=login)

#my profile
@app.route('/profile',methods=['POST','GET']) #login.id 
def profile(): #login.id =user.id
    id = session['id']
    user = User.query.get_or_404(id)

    profile = Profile.query.filter_by(user_id=id).first()

    if request.method == 'POST':
        
        if not profile :
            if 'avatar' not in request.files:
                profile = Profile(bio = request.form['bio'],avatar=None,user_id=id)
            else:
                images = request.files['avatar']
                pic_name = images.filename
                print(pic_name)

                images.save(os.path.join(app.config["IMAGE_UPLOADS"], images.filename))

                profile = Profile(bio=request.form['bio'], avatar=pic_name, user_id=id)

        else:
            if 'avatar' not in request.files:
                profile.bio = request.form['bio']
            else:
                images = request.files['avatar']
                pic_name = images.filename
                print(pic_name)

                images.save(os.path.join(app.config["IMAGE_UPLOADS"], images.filename))
                profile.bio = request.form['bio']
                profile.avatar = pic_name
        try:
            db.session.add(profile)
            db.session.commit()
            
            return redirect('/profile')
        except:
            return 'Error in profile update'
    else:
        return render_template('profile.html', profile=profile, user=user)

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')


@app.route('/delete_tweet/<int:id>')
def delete_tweet(id):     #tweet.id   
   
    tweet_to_delete = Tweet.query.get_or_404(id)
    print('tweet_to_delete: ',tweet_to_delete)

    reply= Reply.query.filter_by(tweet_id=id).all() #delete reply at the same time
    print('reply :', reply)

    good = Good.query.filter_by(tweet_id=id).all()

    if len(reply) > 0:   
        for r in reply:
            print('r : ',r)
            db.session.delete(r)
            db.session.commit()
            print('sussess to delete reply of this tweet')
    if len(good) > 0:
        for g in good:
            print('g : ', g)
            db.session.delete(g)
            db.session.commit()
            print('success to delete good of this tweet')
    try:
        db.session.delete(tweet_to_delete)
        db.session.commit()
        print('success to delete of this tweet')
        
        return redirect('/dashboard')

    except Exception as e:
        print(e)
        return 'delete Error '


@app.route('/tweet/<int:tweet_id>/good', methods=['GET','POST'])
def tweet_good(tweet_id):
    login_id = session['id']

    # print('tweet_id from GET  : ', tweet_id)

    # tweet = Tweet.query.filter_by(id=tweet_id).first() #カウント作りたい
    # print("tweet_id :", tweet)

    already_good = Good.query.filter_by(tweet_id=tweet_id,user_id =login_id).first()
    # print('already_good :',already_good)

    if already_good == None:
      
        good = Good(tweet_id=tweet_id, user_id=login_id ,color='active')

        db.session.add(good)
        db.session.commit()
        print('success to good')

        return redirect('/dashboard')
    else:

        db.session.delete(already_good)   
        db.session.commit()
        print('delete to good')
        
        return redirect('/dashboard')

#other user's pfofile 
@app.route('/user_profile/<int:id>') #user_id
def user_profile(id):
    login_id = session['id']
    user_profile = Profile.query.filter_by(user_id=id).first()
    user = User.query.filter_by(id=id).first()

    followed_id_list = Follow.query.filter_by(source_user_id=login_id).all() #lodin user's follow list
    followed_list = [] #ログインユーザーのフォロー済みのユーザーID
    for followed in followed_id_list:
        followed_list.append(followed.target_user_id)

    # print("フォロー済みuser_id :" ,followed_list)
    
    #display tweet
    gooded_id_list = Good.query.filter_by(user_id=login_id).all() #ログインユーザーのgood.id list
    gooded_list= []
    for gooded in gooded_id_list:
        gooded_list.append(gooded.tweet_id)
    # print('gooded_list',gooded_list)
    # print('gooded_id_list :',gooded_id_list)

    tweets = Tweet.query.filter_by(user_id=id).order_by(Tweet.id.desc()).all()
    # print("tweets",tweets)
    replys = Reply.query.order_by(Reply.id).all()

    return render_template('user_profile.html', user_profile=user_profile,user=user,followed_list=followed_list,tweets=tweets,replys=replys,gooded_list=gooded_list)


@app.route('/user_profile/<int:target_id>/follow',methods=['GET','POST'])
def follow(target_id):
    login_id= session['id']
  
    already_followed = Follow.query.filter_by(source_user_id=login_id,target_user_id=target_id).first()
    print('already_followed :', already_followed)

    if already_followed == None:
        follow = Follow(source_user_id=login_id, target_user_id=target_id)
        db.session.add(follow)
        db.session.commit()
        print("success to follow")

        return redirect(url_for('user_profile',id=target_id))
    else:
        db.session.delete(already_followed)
        db.session.commit()
        print("success to stop following")

        return redirect(url_for('user_profile',id=target_id))
        
    return render_template('user_profile.html', followed_id_list=followed_id_list,followed_list=followed_list,follow=follow)

@app.route('/search', methods=['GET','POST'])
def search():
    keyword = request.form['keyword']
    login_id=session['id']

    users = User.query.order_by(User.id).all()
    # print("users",users)

    if request.method== 'POST':
        
        results = []
        for user in users:
            if keyword in user.name:
                # print("user.name : ",user.name)
                results.append(user)
        # print("results : ",results)

        return render_template('search.html',results=results,users=users)
    
    return render_template('search.html', users=users)



@app.route('/delete_reply/<int:id>')
def delete_reply(id):     #reply.id   
   
    tweet_to_reply = Reply.query.get_or_404(id)
    # print('tweet_to_reply: ',tweet_to_reply)

    try:
        db.session.delete(tweet_to_reply)
        db.session.commit()
        print('success to delete of this reply')
        
        return redirect('/dashboard')

    except Exception as e:
        print(e)
        return 'delete Error '



