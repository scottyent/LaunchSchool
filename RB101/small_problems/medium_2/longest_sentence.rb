# Input: read text from a text file
# Output: prints the longest sentence in the file based on number of words, and the number of words

# Rules
# Sentences may end with periods, exclamation points, or question marks
# Any sequence of characters that are not space or sentence ending characters
# Should be treated as a word.


# Algo
# load the text file using open :DONE
# Read the text file :DONE
# Split it using a split pattern match(split(/[!?.]/)) :DONE
# set empty dictionary with text, word_count :DONE
# Iterate through each of these sentences :DONE
# split it, then measure the size and save it as word_count :DONE
# if word count is bigger than current word_count, set the sentence equal to that text :DONE
# and word count
# in the end, print the text and the word count from the dictionary

require 'pry'
require 'pry-byebug'


def longest_sentence(file_name)
  content = File.read(file_name)
  sentences = content.split(/[!.?]/)
  longest = { text: '', word_count: 0 }

  sentences.each do |sentence|
    sentence_size = sentence.split.size
    if sentence_size > longest[:word_count]
      longest[:text] = sentence + '.'
      longest[:word_count] = sentence_size
    end
  end

  puts longest[:text]
  puts "It has #{longest[:word_count]} words"
end

# Test Cases

# longest_sentence('textfile.txt')
# longest_sentence('frankenstein.txt')

# Further exploration
# Longest word

def longest_word(file)
  content = File.read(file)
  content.gsub!(/[^A-Za-z]/, ' ')
  words = content.split
  longest = { text: '', word_size: 0 }

  words.each do |word|
    word_length = word.size
    if word_length > longest[:word_size]
      longest[:text] = word
      longest[:word_size] = word_length
    end
  end

  puts longest[:text]
  puts "It is #{longest[:word_size]} characters long."
end

# longest_word('textfile.txt')
# longest_word('frankenstein.txt')

# Paragraph
# Split by \n\n

def longest_paragraph(file)
  content = File.read(file)
  paragraphs = content.split(/\n/)
  longest = { text: '', paragraph_size: 0 }

  paragraphs.each do |paragraph|
    paragraph_length = paragraph.size
    if paragraph_length > longest[:paragraph_size]
      longest[:text] = paragraph
      longest[:paragraph_size] = paragraph_length
    end
  end

  puts longest[:text]
  puts "It is #{longest[:paragraph_size]} characters long."
end

longest_paragraph('textfile.txt')
longest_paragraph('frankenstein.txt')