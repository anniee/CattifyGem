require 'cattify/version'
require 'engtagger'

class Cattify
  ADJECTIVES = %w(purry mewly meowwwer).freeze

  def initialize
    @tagger = EngTagger.new
  end

  def process(str)
    #Convert input to lowercase.
    str = str.downcase

    # Extract nouns, prefixing each with one of the
    # above adjectives into sentences of 2 words.

    tagged_str = @tagger.add_tags(str)
    phrases = @tagger.get_nouns(tagged_str).keys
    phrases = phrases.each_with_index.map do |phrase, i|
      "#{adjective(i)} #{phrase}."
    end

    #End every input with "meow".
    phrases << 'meow.'

    # Return a string, separating each sentence
    # with a space.
    phrases.join(' ')
  end

  def adjective(i)
    ADJECTIVES[i % ADJECTIVES.size]
  end
end
