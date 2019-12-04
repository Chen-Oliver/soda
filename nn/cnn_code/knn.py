import numpy as np
import json

import reader
from PIL import Image
import heapq
from random import shuffle

def calc_l2(train_np, train_labels, rec_set, im_dict, season):
    k = 5
    final_ans = []
    count = 0
    for outfit in rec_set:
        # print(count)
        count += 1
        if count == 10:
            break
        top, bot, shoe = outfit
        rec = np.vstack( (np.vstack( (im_dict[top], im_dict[bot]) ), im_dict[shoe]) )

        ans = []
        for idx, our_rec in enumerate(train_np):
            diff = np.linalg.norm(our_rec - rec)
            heapq.heappush(ans, (-diff, train_labels[idx]))
            if len(ans) > k:
                heapq.heappop(ans)

        temp = [0 for i in range(4)]
        distance = 0
        for res in ans:
            temp[res[1]] += 1
            distance += res[0]

        pred = np.argmax(temp)
        if pred == season:
            heapq.heappush(final_ans, (distance, outfit))
            if len(final_ans) > 5:
                heapq.heappop(final_ans)

    return [i[1] for i in final_ans]


def knn(train_set, train_labels, rec_set, url_to_jpg, season):
    shuffle(rec_set)
    train_np = []
    im_dict = {}

    for k, v in url_to_jpg.items():
        path = 'nn/images/' + v
        image = Image.open(path)
        image.load()
        data = np.asarray( image, dtype="int32" ).flatten()
        im_dict[k] = data

    train_np = []
    for outfit in train_set:
        top, bot, shoe = outfit
        big_pic = np.vstack( (np.vstack( (im_dict[top], im_dict[bot]) ), im_dict[shoe]) )
        train_np.append(big_pic)

    return calc_l2(train_np, train_labels, rec_set, im_dict, season)

def load_data_json(filename):
    with open(filename) as f:
        data = json.load(f)
        return data

def main(season):

    train_set, train_labels, rec_set, url_to_jpg = reader.load_dataset()
    seasons = {'summer': 0, 'fall': 1, 'winter': 2, 'spring': 3}

    res = knn(train_set, train_labels, rec_set, url_to_jpg, seasons[season])
    print(res)
    # print("[[1, 2, 3], [1, 2, 3]]")



import sys
if __name__ == '__main__':
    res = main(sys.argv[1])
