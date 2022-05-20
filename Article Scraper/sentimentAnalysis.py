import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from datascraper2 import reddit

sid = SentimentIntensityAnalyzer()

reddit_arr = reddit()

for i in range(len(reddit_arr)):
    if sid.polarity_scores(reddit_arr[i]['Title'])['pos'] > 0:
        print(reddit_arr[i]['Title'])
        print(sid.polarity_scores(reddit_arr[i]['Title'])['pos'])
