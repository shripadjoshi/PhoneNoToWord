require 'benchmark'
require_relative './lib/constants'
require_relative './lib/validator'

#Class to convert number to word
class ConvertNumberToWord

  #fetch the constants
  @@number_mappings, @@dictionary_words = Constant.set_constants



  #Converts the passed number to words
  def convertToWords(number)
    validation_message = ValidateNumber.validate(number)
    if validation_message === 'Validated' 
      phone_words = generate_words(number)
      words = phone_words

      ##This will prepare the repeated permutations for two digits
      ##It will prepare the no to split between the two components
      ##such as [[3,7], [4,6], [6,4], [5,5]]
      #and the sum of the number should be 10 rejecting all the other combinations
      two_words_combinations = [3,4,5,6,7].repeated_permutation(2).to_a.select{|combi| combi if combi.sum == 10}

      two_words_combinations.each do |combi|
        start_nos = number.slice(0..combi[0]-1)
        end_nos = number.slice(combi[0]..9)
        start_words = generate_words(start_nos)
        end_words = generate_words(end_nos)
        if start_words.length > 0 && end_words.length > 0
          words += start_words.product(end_words)
        end
      end

      ##This will prepare the repeated permutations for three digits
      ##It will prepare the no to split between the three components
      ##such as [[3,3,4], [3,4,3], [4,3,3]]
      #and the sum of the number should be 10 rejecting all the other combinations
      three_words_combinations = [3,4,5,6,7].repeated_permutation(3).to_a.select{|combi| combi if combi.sum == 10}

      three_words_combinations.each do |combi|
        start_nos = number.slice(0..combi[0]-1)
        middle_nos = number.slice(combi[0]..(combi[0]+combi[1])-1)
        
        end_nos = number.slice((combi[0]+combi[1])..9)

        start_words = generate_words(start_nos)
        middle_words = generate_words(middle_nos)

        end_words = generate_words(end_nos)
        if start_words.length > 0 && end_words.length > 0
          words += start_words.product(middle_words, end_words)
        end
      end

      words.select!{|w| !phone_words.include?(w[0]+w[1]) }

    else
      puts validation_message
    end
  end

  # Generate array of words from the phone number.
  def generate_words(number)
    word_combinations = nil
    number.each_char do |num|
      number_mapping = @@number_mappings[num.to_i]
      word_combinations = (
        if word_combinations 
          word_combinations.product(number_mapping)
        else
          number_mapping
        end
      )
    end

    (word_combinations.map { |e| e.flatten().join}).select { |w| check_word_exists?(w) }
  end

  # Check if word exsits in the dictionary
  def check_word_exists?(word)
    upcaseword = word.upcase
    @@dictionary_words.bsearch{|x| x >= upcaseword } == upcaseword
  end

  
end
puts "Input the 10 digit number."
number = gets
puts "----------------------Benchmark result------------------------"
puts Benchmark.measure { 
  print ConvertNumberToWord.new().convertToWords(number.to_s.strip) 
}

