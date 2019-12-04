from os import listdir
from os.path import isfile, join
import numpy as np
from PIL import Image
import json

def fetch_from_db(types):
    import os
    import psycopg2

    DATABASE_URL = os.environ['DATABASE_URL']

    connection = psycopg2.connect(DATABASE_URL, sslmode='require')
    cursor = connection.cursor()
    postgreSQL_select_Query = "Select imageURL, type from colors NATURAL JOIN clothing"

    cursor.execute(postgreSQL_select_Query)
    mobile_records = cursor.fetchall()

    for row in mobile_records:
        types[row[1]].append(row[0])


def load_image( infilename ) :
    img = Image.open( infilename )
    img.load()
    data = np.asarray( img, dtype="int32" )
    return data

def load_data_json(filename):
    with open(filename) as f:
        data = json.load(f)
        return data

def load_dataset():

    recs = load_data_json("nn/cnn_code/our_rec.json")

    summer = recs["summer"]
    spring = recs['spring']
    winter = recs['winter']
    fall = recs['fall']

    train_set = []
    train_label = []

    for summ, spr, win, fa in zip(summer, spring, winter, fall):
        train_set.append(summ)
        train_label.append(0)

        train_set.append(fa)
        train_label.append(1)

        train_set.append(win)
        train_label.append(2)

        train_set.append(spr)
        train_label.append(3)


    types = {'Sweater':[], 'Pants':[], 'Coat':[], 'Shirt':[], 'Jacket':[], 'Shoes':[]}

    fetch_from_db(types)
    

    rec_set = []
    count = 0

    for tops in (types['Sweater'] + types['Coat'] + types['Shirt'] + types['Jacket']):
        for bots in (types['Pants']):
            for shoe in (types['Shoes']):
                temp = [tops, bots, shoe]
                if temp not in train_set:
                    rec_set.append([tops, bots, shoe])
                    count += 1

    url_to_jpg = load_data_json("nn/cnn_code/url_to_jpg.json")

    return train_set, train_label, rec_set, url_to_jpg
