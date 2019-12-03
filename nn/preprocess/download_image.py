import urllib.request
from PIL import Image
import json

def find_nth(string, substring, n):
   if (n == 1):
       return string.find(substring)
   else:
       return string.find(substring, find_nth(string, substring, n - 1) + 1)

id = dict()
with open('images.txt') as fp:
   count = 0
   for line in fp:

       content = line[65:-3]
       starting_comma = content.find(",")
       ending_comma = find_nth(content[::-1], ',', 2)
       content = content[starting_comma + 3 : -ending_comma - 2]

       id[str(count) + ".jpg"] = content


       image_name = "../images/"+ str(count) + ".jpg"
       data = urllib.request.urlretrieve(content, image_name)
       im1 = Image.open(image_name)
       im_small = im1.resize((128, 128), Image.ANTIALIAS)
       im_small.save(image_name, "JPEG", optimize=True)

       count += 1

with open('data.json', 'w') as f:
    json.dump(id, f)
