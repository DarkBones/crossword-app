import os
import random
import numpy as np
import json
import sys
import getopt

debug_mode = False
max_words = 0
min_height = 8

words = {}

def main(argv):
	parse_args(argv)

	get_words()
	generate_puzzles()


def get_words():
	print_header('get words')

	global max_words, words

	words_path = os.path.join('data', 'words')
	f = open(words_path)
	lines = f.readlines()

	words = {}
	n = 0
	for line in lines:
		if n >= max_words and max_words > 0:
			print(' reached max words', end='')
			break

		if n % 1000 == 0:
			print('.', end='')

		word = line.strip()
		length = len(word)

		if not length in words:
			words[length] = []

		words[length].append({ 'word': word, 'line': n})

		n += 1

	print(f'\nFound {n} words in {len(words)} different lengths')

def generate_puzzles():
	print_header('generate puzzles')

	global min_height, words

	for height in sorted(words.keys()):
		if height < min_height:
			continue

		print(height)


def parse_args(argv):
	global debug_mode, max_words, min_height

	help_message = """
usage: python puzzle_creator.py
Options and arguments:
-d\t: Debug mode, main 'puzzles' file not modified
-h\t: print this help message and exit (also --help)
-n arg\t: maximum number of words to use (also --max_words)
-m arg\t: minimum puzzle height (also --min_height)
	"""

	try:
		opts, args = getopt.getopt(argv, 'dhm:n:', ['help', 'max_words=', 'min_height'])
	except getopt.GetoptError:
		print(help_message)
		sys.exit(2)
	for opt, arg in opts:
		if opt in ['-h', '--help']:
			print(help_message)
			sys.exit()
		elif opt == '-d':
			debug_mode = True
		elif opt in ['-n', '--max_words']:
			max_words = int(arg)
		elif opt in ['-m', '--min_height']:
			min_height = int(arg)

def print_header(header):
	suff = '------------------------------------------------------'
	print(f'\n-- {header.upper()} {suff[len(header):]}')


if __name__ == '__main__':
	main(sys.argv[1:])