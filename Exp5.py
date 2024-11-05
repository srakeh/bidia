from random import shuffle
from pybloom_live import BloomFilter 
import math

n = 20  
p = 0.05  
bloomf = BloomFilter(capacity=n, error_rate=p)
size = len(bloomf)  # Corrected the method call to len(bloomf)
hash_count = math.ceil((size / n) * math.log(2))  
print("Size of bit array: {}".format(size))
print("False positive Probability: {}".format(bloomf.error_rate))
print("Number of hash functions: {}".format(hash_count))

word_present = ['abound', 'abounds', 'abundance', 'abundant', 'accessible', 'bloom', 'blossom', 'bolster', 'bonny', 'bonus', 
                'bonuses', 'coherent', 'cohesive', 'colorful', 'comely', 'comfort', 'gems', 'generosity', 'generous', 'generously', 
                'genial']
word_absent = ['bluff', 'cheater', 'hate', 'war', 'humanity', 'racism', 'hurt', 'nuke', 'gloomy', 'facebook', 'geeksforgeeks', 
               'twitter']

for item in word_present:
    bloomf.add(item)

shuffle(word_present) 
shuffle(word_absent)

test_words = word_present[:10] + word_absent
shuffle(test_words)

for word in test_words:
    if word in bloomf:
        if word in word_absent:
            print("'{}' is a false positive!".format(word))
        else:
            print("'{}' is probably present!".format(word))
    else:
        print("'{}' is definitely not present!".format(word))
