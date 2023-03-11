require_relative 'draw.rb'
require 'pry'


def clear
  system('clear')
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
  @game_word_array = @game_word.split('')
  @failures = 0
  @hidden_word = Array.new(@game_word.length,'_')
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
    
    end
  guess
  
end


def valid_letter?(letter)

    if @game_word_array.include? letter
      replace_hidden(letter)
    elsif !@incorrect_letters.include? letter
      @incorrect_letters << letter << " "
      @failures += 1
    else
      puts "Something went wrong, you shouldn't be here"
    end
    @guesses += 1
end

def replace_hidden(letter)
  @game_word_array.each_with_index do |element, index|
    if letter == element
      @hidden_word[index] = letter
    end
  end
end
  
def select_game_type
  in_progress = false

  while !in_progress do

    p 'Type 1 to start a new game,'
    p 'Type 2 to load a saved game,'
    game_type = gets.chomp

    if game_type.to_i == 1
      clear
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
end

def check_end_conditions
  if @hidden_word === @game_word_array
    puts "Game Over, You Win!"
    return false
  end

  if @failures == 6
    draw(@failures)
    puts "The word was #{@game_word}"
    puts "Game over, You Lose"
    return false
  end
  true
end

def hangman

  @failures = 0
  @incorrect_letters = ""
  @guesses = 0
  @game_word
  @game_word_array = []
  @hidden_word = []
  @guessed_letters = Array.new
  
  in_progress = true

  select_game_type
  
  p 'Welcome to hang man!'  
  
  while in_progress
    draw(@failures)
    p @hidden_word
    valid_letter?(get_player_guess)
    
    in_progress = check_end_conditions

  end

end


hangman



def save_game

end

def load_game

end