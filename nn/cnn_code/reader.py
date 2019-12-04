# reader.py
# ---------------
# Licensing Information:  You are free to use or extend this projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to the University of Illinois at Urbana-Champaign
#
# Created by Justin Lizama (jlizama2@illinois.edu) on 09/28/2018
"""
This file is responsible for providing functions for reading the files
"""
from os import listdir
from os.path import isfile, join
import numpy as np
from PIL import Image
import json

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

    recs = load_data_json("../our_rec.json")

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
    with open('image_and_type.txt') as fp:
       for line in fp:
           url, type = line.split('|')
           url = url.strip()
           type = type.strip()
           types[type].append(url)

    rec_set = []
    count = 0

    for tops in (types['Sweater'] + types['Coat'] + types['Shirt'] + types['Jacket']):
        for bots in (types['Pants']):
            for shoe in (types['Shoes']):
                temp = [tops, bots, shoe]
                if temp not in train_set:
                    rec_set.append((tops, bots, shoe))
                    count += 1

    url_to_jpg = load_data_json("../preprocess/url_to_jpg.json")

    return train_set, train_label, rec_set, url_to_jpg
load_dataset()
