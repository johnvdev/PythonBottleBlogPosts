"""
Routes and views for the bottle application.
"""
import re
from bottle import  route, view, request, redirect, post
from datetime import datetime
from MongoDb import coll
from bson import ObjectId

@route('/')
@route('/home')
@view('index')
def home():
    title = request.query.get('txtTitle')
    text = request.query.get('txtText')
    tags = request.query.get('txtTags')

    if title or text or tags :
        
        aggregate = []

        if title:
            aggregate.append({'post_title': {'$regex':'^.*'+title+'.*$', '$options' : '-i'}})
        if text:
            aggregate.append({'post_text': {'$regex':'^.*'+text+'.*$', '$options' : '-i'}})
        if tags:
            aggregate.append({'post_tags': {'$regex':'^.*'+tags+'.*$', '$options' : '-i'}})

        result = coll.find({'$or': aggregate})       
        blogs = list(result)
        return dict(
            blog_list = blogs
            )
    else:
        result = coll.find()
        blogs = list(result)
        return dict(
            blog_list = blogs
            )
       

   
@route('/blog/info/<bId>')
@view('info')
def show_blog_info(bId):
   
    b_doc = coll.find_one({"_id":ObjectId(bId)})


    return dict(
       blog_info = b_doc 

    )

@route('/blog/add')
@view('add')
def add():
    return None


@post('/add_post')
def add_post():
    title = request.forms.get('txtTitle')
    text = request.forms.get('txtText')
    tags = request.forms.get('txtTags')
    tagsList = [x.strip() for x in tags.split(',')]

    coll.insert_one({ "post_date": datetime.now(), "post_title": title, "post_text": text, "post_tags":tagsList })
    
    redirect('/')

@route('/blog/edit/<bId>')
@view('edit')
def show_Post(bId):

    p_doc = coll.find_one({"_id":ObjectId(bId)})
    p_doc["post_tags"] = ",".join([str(x) for x in p_doc["post_tags"]]) 
    return dict(
       post = p_doc
    )


@post('/edit_post')
def update_pokemon_doc():
    id = request.forms.get('txtID')
    title = request.forms.get('txtTitle')
    text = request.forms.get('txtText')
    tags = request.forms.get('txtTags')
    tagsList = [x.strip() for x in tags.split(',')]

    update_result = coll.update_one(
                                        {"_id": ObjectId(id)},
                                        {"$set":{"post_title":title, "post_text":text, "post_tags":tagsList}}
                                    )
    redirect('/')

@route ('/blog/delete/<pID>')
def delete_pokemon(pID):
    delete_result = coll.delete_one({"_id":ObjectId(pID)})
    redirect('/')



