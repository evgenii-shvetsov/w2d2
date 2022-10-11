class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
 #PART 1 
  def self.random_word
    DICTIONARY.sample
  end

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

    def guess_word
        @guess_word
    end

    def attempted_chars
      @attempted_chars
    end

    def remaining_incorrect_guesses
      @remaining_incorrect_guesses
    end

    def already_attempted?(char)
      if @attempted_chars.include?(char)
        true
      else 
        false
      end
    end

    def get_matching_indices(str)
      vowels = "aeiou"
      vowels_indices = []
      @secret_word.each_char.with_index do |char, i|
        if char == str
          vowels_indices << i 
        end
      end
      vowels_indices
    end

    def fill_indices(char,arr)
      arr.each do |ele|
        @guess_word[ele] = char
      end
    end

#PART 2
    def try_guess(char)
      if already_attempted?(char)
        p 'that has already been attempted'
        false
      else
        @attempted_chars << char
        
        matching_indices = get_matching_indices(char)
        
        if matching_indices.length == 0 
          @remaining_incorrect_guesses -= 1
        else
          fill_indices(char, matching_indices )
        end
        true
      end
    end

    def ask_user_for_guess
      p "Enter a char"
      input = gets.chomp
      try_guess(input)
    end

    def win?
      if @guess_word.join('') == @secret_word
        p "WIN"
        true
      else
        false
      end  
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        p "LOSE"
        true
      else 
        false
      end
    end

    def game_over?
      if win? || lose?
        p @secret_word
        true
      elsif !win? && !lose?
        false
      end
    end
  
end
