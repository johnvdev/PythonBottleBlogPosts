"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime
from MongoDb import coll
from bson import ObjectId

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    result = coll.find()
    blogs = list(result)

    return dict(
       blog_list = blogs
    )

@route('/blog/info/<bId>')
@view('info')
def show_blog_info(bId):
   
    b_doc = coll.find_one({"_id":ObjectId(bId)})

    print(b_doc)

    return dict(
       blog_info = b_doc 

    )

@route('/blog/add')
@view('add')
def add():
    return None


