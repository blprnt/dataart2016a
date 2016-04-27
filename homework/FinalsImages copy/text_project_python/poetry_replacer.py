
# coding: utf-8

# # Part 2: Loading poem

# In[141]:

import string
import random
#from fuzzywuzzy import fuzz
import sys
import pickle
import pandas as pd
#import pprint


# In[142]:

# loads emotion dictionary
work_dict = pickle.load(open( "emotion_dictionary.p", "rb" ))
emotion = pd.read_csv('english_emotion.csv')


# In[143]:

#like a set in math
punctuation_set = set(string.punctuation)


# In[144]:
text_file = open("reimagined_poem.txt", "w")

#open poem
for line in open(sys.argv[1]):
    line = line.strip()
    line = line.lower()
    # replace punctuation
    for punctuation in punctuation_set:
        line = line.replace(punctuation, '') #replace punctuation with nothing
    line = line.replace('"','')
    words = line.split()
    
    
    new_array = []
    for word in words:
        if word in work_dict.keys():
            new_array.append(random.choice(work_dict[word]))
        else:
            new_array.append(word) #keep the orders of the words
    reconstructed_line = [elem if elem in emotion.columns[1:] else ' ' for elem in new_array] #list comprehension/basically a for loop
    print(' '.join(reconstructed_line))
    text_file.write(' '.join(reconstructed_line))

text_file.close()

# In[ ]:



