require 'pry'

class PigLatinizer

  def piglatinize(input_str)
    input_str.split(" ").map{ |word| piglatinize_word(word)}.join(" ")
  end

  private

  def vowel?(char)
    char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize_word(word)
    # word starts with vowel
    if vowel?(word[0])
      word + "way"
    else
    # word starts with one or more consonants
      vowel_index = word.index(/[aAeEiIoOuU]/)
      consonants = word.slice(0..vowel_index-1)
      word_leftover = word.slice(vowel_index..word.length)
      word_leftover + consonants + "ay"
    end
  end

end


# class PigLatinizer
#     attr_reader :phrase

#     def initialize(phrase) 
#         @phrase = phrase.downcase.split(" ")
#     end

#     def piglatinize
#         @phrase.map do |word|
#             if word.start_with?("bl", "cl", "fl", "gl", "pl", "br", "cr", "dr", "fr", "gr", "pr", "tr", "sk", "sl", "sp", "st", "sw", "cr")
#                 first = word.gsub(/(\S)(\S+)/, '\2\1')
#                 second = first.gsub(/(\S)(\S+)/, '\2\1') + "ay"
#             elsif word.start_with?("str", "sch", "spr")
#                 first = word.gsub(/(\S)(\S+)/, '\2\1')
#                 second = first.gsub(/(\S)(\S+)/, '\2\1')
#                 third = second.gsub(/(\S)(\S+)/, '\2\1') + "ay"
#             elsif word.start_with?("a", "e", "i", "o", "u")
#                 word + "way"
#             else
#                 word.gsub(/(\S)(\S+)/, '\2\1') + "ay" 
#             end
#         end

#     end
# end