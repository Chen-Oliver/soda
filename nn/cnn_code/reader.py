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

def load_dataset(filename, favorites):

    images = [(f, join(filename, f)) for f in listdir(filename) if isfile(join(filename, f))]
    data_dict = load_data_json("../preprocess/data.json")

    train_labels = []
    train_set = []
    rec_set = []
    rec_names = []

    for image in images:
        fname, image_path = image

        in_fav = False
        if data_dict[fname] in favorites:
            train_labels.append(1)
            in_fav = True
        else:
            train_labels.append(0)

        im = Image.open(image_path)
        np_im = np.array(im).flatten()
        train_set.append(np_im)
        # if not in_fav:
        rec_set.append(np_im)
        rec_names.append(fname)

    train_set = np.array(train_set)
    train_labels = np.array(train_labels)
    rec_set = np.array(rec_set)

    return train_set, train_labels, rec_set, rec_names
