def phrase_to_array(phrase)
  phrase = phrase.chars
# To edi an array you have to use the .map method
  phrase.map { |letter| letter.ord}
end

def array_to_phrse(array_of_number)
  array_of_number.map { |number| number.chr}.join
end

def cypher(message, shift)
  message = phrase_to_array(message)
  message = message.map{ |letter| 
  # Because fuck you readability
  # I check if input is a character and the shift doesn't overflow
  # This way i don't have to fuck around with spaces or other interpunctuation
    if ( letter > 64 && letter < 91 && (letter + shift) < 91 ) || ( letter > 96 && letter < 123 && (letter + shift) < 123 ) 
      letter + shift
    elsif ( letter > 64 && letter < 91 ) || ( letter > 96 && letter < 123 ) 
      letter + shift - 26
    else
      letter
    end 
  }  
  array_to_phrse(message)
end



puts "Hello what do you want to cypher?"
plainPhrase = gets.chomp
puts "whats the key?"
key = gets.chomp.to_i
puts cypher(plainPhrase, key)





