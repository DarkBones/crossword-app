require 'test_helper'

class WordTest < ActiveSupport::TestCase
  def test_uuid
  	word = Word.create!(answer: 'test', clue: 'clue')

  	assert_not_nil word.uuid
  end

  def test_length
  	word = Word.create!(answer: 'test', clue: 'clue')

  	assert_equal 4, word.length

  	word = Word.create!(answer: 'longerword', clue: 'clue')

  	assert_equal 10, word.length
  end

  def test_capitalization
  	word = Word.create!(answer: 'LowerCase', clue: 'Clue')

  	assert_equal 'LOWERCASE', word.answer
  end

  def test_validation
  	word = Word.new(answer: 'test')
  	assert_not word.valid?

  	word = Word.new(clue: 'clue')
  	assert_not word.valid?

  	word = Word.new(answer: 'test', clue: 'clue')
  	assert word.valid?
  end
end