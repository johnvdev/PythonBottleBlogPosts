from pymongo import MongoClient
conn = MongoClient('localhost', 27017)
db = conn.lab5
coll = db.blogs
