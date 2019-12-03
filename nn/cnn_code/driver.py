# mp6.py
# ---------------
# Licensing Information:  You are free to use or extend this projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to the University of Illinois at Urbana-Champaign
#
# Created by Justin Lizama (jlizama2@illinois.edu) on 10/27/2018
import sys
import argparse
import configparser
import copy
import numpy as np
import json

import reader
import neuralnet as p
import torch

"""
This file contains the main application that is run for this MP.
"""


def main(favorites):
    train_set, train_labels, rec_set, rec_names = reader.load_dataset("../images", favorites)
    train_set = torch.tensor(train_set,dtype=torch.float32)
    train_labels = torch.tensor(train_labels,dtype=torch.int64)
    rec_set = torch.tensor(rec_set,dtype=torch.float32)
    labels = p.fit(train_set,train_labels, rec_set, rec_names)
    return labels

def load_data_json(filename):
    with open(filename) as f:
        data = json.load(f)
        return data

    # torch.save(net, "net.model")
if __name__ == '__main__':
    data = load_data_json("../preprocess/data.json")
    favorites = [data["2.jpg"], data["3.jpg"], data["4.jpg"], data["5.jpg"], data["6.jpg"], data["7.jpg"], data["8.jpg"]]
    res = main(favorites)
    print(res)
