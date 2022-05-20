import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from datascraper2 import reddit, allNews

cred = credentials.Certificate('/Users/thomas/Desktop/University/Year Three/Final project/Article Scraper/good-news-11954-firebase-adminsdk-txv8x-4a2d474267.json')
firebase_admin.initialize_app(cred)

def populate(obj):

    db = firestore.client()

    for i in range(len(obj)):

        doc_ref = db.collection(u'articles').document(obj[i]["Title"])
        doc_ref.set({
            u'ArType': obj[i]["ArType"],
            u'Author': obj[i]["Author"],
            u'Body': obj[i]["Body"],
            u'Date': obj[i]["Date"],
            u'Title': obj[i]["Title"],
            u'Link': obj[i]["Link"],
            u'Image': obj[i]["Image"]
        })

        print(obj[i]["ArType"] + " " + obj[i]["Title"] + " added to database.")

populate(reddit())
populate(allNews())