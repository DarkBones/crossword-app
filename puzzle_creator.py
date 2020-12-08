import os
import random
import numpy as np
import json

debug_mode = False

dataset_path = os.path.join('data')
words_path = os.path.join(dataset_path, 'words')
clues_path = os.path.join(dataset_path, 'clues')
puzzles_path = os.path.join(dataset_path, 'puzzles')

min_height = 8


print('Getting words...')
f = open(words_path)
lines = f.readlines()

words = {}
n = 0
max_n = 10000
for line in lines:
    if n >= max_n and max_n > 0:
        break
    
    word = line.strip()
    length = len(word)
    
    if not length in words:
        words[length] = []
    
    words[length].append({ 'word': word, 'line': n})
    
    n += 1

print(f'Found {len(words)} word lengths')


def create_puzzle(width, height, seed, illegal_down_words = 0, illegal_down_columns = 0):
	if illegal_down_columns >= width:
		if illegal_down_words >= len(words[height]):
			return
		return create_puzzle(width, height, seed, illegal_down_words + 1, 0)

	if illegal_down_words >= len(words[height]):
		return

	np.random.seed(seed)
	random.seed(seed)

	down_index = np.random.permutation(len(words[height]))[illegal_down_words]
	down = words[height][down_index]
	print(down['word'])

# GENERATE PUZZLES
seed_i = 0
for height in sorted(words.keys()):
	if height < min_height:
		continue

	for width in sorted(words.keys()):
		seed_i += 1
		create_puzzle(width, height, seed_i)