import sys
import random
from textblob import TextBlob, Word
import codecs
from collections import defaultdict
import json

#Define variables
source_text = sys.argv[1]

charAll = ['Agamemnon', 'Patroclus', 'Odysseus', 'Diomedes', 'Great Ajax', 'Little Ajax', 'Nestor', 'Menelaus', 'Idomeneus', 'Machaon', 'Calchas', 'Peleus', 'Phoenix', 'Hector', 'Priam', 'Hecuba', 'Helen', 'Aeneas', 'Andromache', 'Polydamas','Glaucus', 'Agenor', 'Dolon', 'Pandarus', 'Antenor', 'Sarpedon', 'Chryseis', 'Briseis', 'Chryses', 'Zeus', 'Hera', 'Athena', 'Thetis', 'Apollo', 'Aphrodite', 'Poseidon', 'Hephaestus', 'Artemis', 'Ares', 'Hermes', 'Iris'] 
charTop = ['Agamemnon', 'Patroclus', 'Odysseus', 'Diomedes', 'Great Ajax', 'Nestor', 'Menelaus', 'Hector', 'Priam', 'Hecuba', 'Helen', 'Aeneas', 'Andromache', 'Zeus', 'Hera', 'Athena', 'Apollo', 'Aphrodite', 'Poseidon', 'Artemis', 'Ares'] 
charHuman = ['Agamemnon', 'Patroclus', 'Odysseus', 'Diomedes', 'Great Ajax', 'Little Ajax', 'Nestor', 'Menelaus', 'Idomeneus', 'Machaon', 'Calchas', 'Peleus', 'Phoenix', 'Hector', 'Priam', 'Hecuba', 'Helen', 'Aeneas', 'Andromache', 'Polydamas','Glaucus', 'Agenor', 'Dolon', 'Pandarus', 'Antenor', 'Sarpedon', 'Chryseis', 'Briseis', 'Chryses']
charDivine = ['Zeus', 'Hera', 'Athena', 'Thetis', 'Apollo', 'Aphrodite', 'Poseidon', 'Hephaestus', 'Artemis', 'Ares', 'Hermes', 'Iris']

traits = defaultdict(set)

#Grab the source text and extract the adjectives
blob = TextBlob(open(source_text).read())

def extract_adjs(n):	
	adjs = list()			
	for sentence in blob.sentences:
		if n in sentence:
			for word, tag in sentence.tags:
				if tag =='JJ':
					adjs.append(word.lower())
	for a in adjs:
		traits[n].add(a)	

# extract_adjs(name)
# print traits[name]	

for i in charAll:
	extract_adjs(i)
	for a in traits[i]:
		print i, a

# f = open('output2.json')		
# for i in charAll:
# 	extract_adjs(i)
# 	dict(traits)
# 	json.dump(f, traits)		