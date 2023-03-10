require_relative 'draw.rb'
require 'pry'


def clear
  system('clear')
end

def select_game_type

end

def pick_word
  word = ""
  word_list = File.readlines('google-10000-english-no-swears.txt')
  seed = Random.new
  while word.length <=5 || word.length > 11 do
    word = word_list[seed.rand(word_list.length)].chomp
  end
  word
end


def new_game
  @game_word = pick_word.upcase
  p @game_word
  @failures = 0
  @hidden_word = Array.new(@game_word.length,'_')
  p @hidden_word
end

def get_player_guess
  
  guess_valid = false

    while !guess_valid do
    puts "Enter your guess"
    guess = gets.chomp.upcase
    
      if guess.length != 1
        puts "Invalid Guess"
      else  
        guess_valid = true
      end
    guess
  end
end


def compare_guess(letter)
  
end

def valid_letter?(letter)
  puts letter
end
  

def hangman

  @failures = 0
  @guesses = 0
  @game_word = ""
  @hidden_word = {}
  @guessed_letters = Array.new
  

  in_progress = false
  
  p 'Welcome to hang man!'

  while !in_progress do

    p 'Type 1 to start a new game,'
    p 'Type 2 to load a saved game,'
    game_type = gets.chomp

    if game_type.to_i == 1
      #clear
      in_progress = true
      new_game
    elsif game_type.to_i == 2
      clear
      puts 'Loading not yet implemented try again'
    else
      clear
     puts 'Try Again'
    end
  end
  
  
  while in_progress
    valid_letter?(get_player_guess)

    in_progress = false

  end
  #variables
    #word
    #number of guesses
    #failures
    #win
    #guessed letters
  
  #start or load

  #start
  #Pick random word greater than 5 letters less than 11
  #display word _ and hang man
  # +----+
  # |    |
  # |    0
  # |   /|\
  # |   / \
  # | 
  # ========

  #Player picks letter
  #check if letter is correct
  #if correct add to display
  #else add to hangman and decrement timer


end


hangman




def load_game

end