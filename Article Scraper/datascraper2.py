from datetime import datetime
import requests
from newsapi import NewsApiClient
import json

def reddit():
    #Authorize program with reddit API
    app_id = ''
    secret = ''
    auth = requests.auth.HTTPBasicAuth(app_id, secret)

    reddit_username = 'DissoBot1'
    reddit_password = 'Marina0197'

    #Authorize reddit account with API
    data = {
        'grant_type': 'password',
        'username': reddit_username,
        'password': reddit_password
    }
    #Accessing API with above credentials to receive access token (lasts for 2 hours).
    #Uses access token to request from reddit.
    headers = {'User-Agent': 'DissoBot/0.0.1'}
    res = requests.post('https://www.reddit.com/api/v1/access_token', auth=auth, data=data, headers=headers)
    token = res.json()['access_token']
    headers['Authorization'] = 'bearer {}'.format(token)
    requests.get('https://oauth.reddit.com/api/v1/me', headers=headers)
    api = 'https://oauth.reddit.com'
    
    #Specifically request from the All "subreddit" sorted by Top posts of the current day.
    #Limiting the number of posts collected.
    res = requests.get('{}/r/all/top'.format(api), headers=headers, params={'limit': '100'})

    parsed = json.loads(res.text)
    print(json.dumps(parsed, indent=4,sort_keys=True))

    #Scans through json object supplied from the above request.
    #Collects specific parameters from each post and creates an object which is appended to an array.
    # ListOfSubs = []
    # for post in res.json()['data']['children']:
    #     # if post['data']['is_video'] == True:
    #     #     continue
    #     if post['data']['preview']['images'][0]['variants'] != {}:
    #         continue 
    #     if post['data']['post_hint'] != "image":
    #         continue
    #     sub = {}
    #     sub['Author'] = post['data']['author']
    #     sub['Title'] = post['data']['title']
    #     sub['Body'] = post['data']['selftext']
    #     sub['Image'] = post['data']['url']
    #     sub['Link'] = "www.reddit.com" + post['data']['permalink']
    #     sub['ArType'] = 'image'
    #     sub['Date'] = datetime.today().strftime('%Y-%m-%d')

    #     ListOfSubs.append(sub)

    # return ListOfSubs

print(reddit())

def allNews():
    api = NewsApiClient(api_key='')

    all_articles = api.get_top_headlines(language='en')
    
    ListOfArticles = []

    for item in all_articles['articles'][1:10]:
        article = {}
        article['Author'] = item['author']
        article['Title'] = item['title']
        article['Body'] = item['content']
        article['Image'] = item['urlToImage']
        article['Link'] = item['url']
        article['ArType'] = 'article'
        article['Date'] = datetime.today().strftime('%Y-%m-%d')
        ListOfArticles.append(article)
    
    return ListOfArticles