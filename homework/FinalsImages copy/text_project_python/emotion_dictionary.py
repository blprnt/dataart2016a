
# coding: utf-8

# In[5]:

# import required modules
import pandas as pd
import pickle


# In[2]:

# read english_emotion.csv
emotion = pd.read_csv('english_emotion.csv')


# In[3]:

# create word_dict
work_dict = {}


# In[4]:

# Loops through dictionary and appends emotions for each word
for word in emotion['English Word']:
    this_words_array = list(emotion.columns[(emotion.loc[emotion['English Word'] == word, :].values[0] == 1)])
    if len(this_words_array) == 0:
        this_words_array = [' ']
    
    work_dict.update({word: this_words_array})


# In[6]:

# saves the emotion dictionary
pickle.dump( work_dict, open( "emotion_dictionary.p", "wb" ) )

