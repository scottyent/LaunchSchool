=begin
Input: Nothing! Reading from a text file
Output: A madlibs with randomized selections from preselected list you have created

Rules


Steps:
use the open method to create a file from the text file I created
read it all into the variable that I want :DONE

structure the choices as a Hash, and the values are arrays. so adverbs: => %w(easily lazily noisily excitedly) :DONE

then assign a specific adjective, noun, adverb, and verb using hash access.sample for the array :DONE

the puts the text variable that already has the interpolation in it
  Ok this is where we hit a problem. The string interpolation doesn't work and I'm not sure to get it to work. I'm going to think on this one.

=end
require 'pry'
require 'pry-byebug'

def generate_madlibs(file_name)

  choices = {
    "adjective" => %w(quick lazy sleepy ugly),
    "noun" => %w(fox dog head leg),
    "verb" => %w(jumps lifts bites licks),
    "adverb" => %w(easily lazily noisily excitedly)
  }

  file = File.open("#{file_name}")
  story = file.read
  story_array = story.split

  choices.each do |type, value_array|
    if type == "verb"
      story.count(type).times do |_|
        story.sub!(/\bverb\b/, value_array.sample)
      end
    else
      story.count(type).times do |_|
        story.sub!(type, value_array.sample)
      end
    end
  end

  puts story
end

# Test Cases
generate_madlibs("madtext.txt")