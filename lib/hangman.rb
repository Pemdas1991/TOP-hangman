frozen_string_literal: true

require_relative 'draw.rb'
require 'pry'
require 'msgpack'


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
      puts "Enter your guess, Type 'save' to save your game."
      guess = gets.chomp.upcase
    
      if guess.upcase == 'SAVE'
        save_game
      elsif guess.length != 1
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
    end

    if game_type.to_i == 2
      clear
      if File.exists?("save.txt")
        in_progress = true
        load_game
      else
        puts "Save does not exist!"
      end
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
    
  while in_progress
    draw(@failures)
    p @hidden_word
    valid_letter?(get_player_guess)
    
    in_progress = check_end_conditions

  end

end



def save_game

  msg = {
    :failures => @failures, 
    :incorrect_letters => @incorrect_letters, 
    :guesses => @guesses,
    :game_word => @game_word,
    :game_word_array => @game_word_array,
    :hidden_word => @hidden_word,
    :guessed_letters => @guessed_letters
  }.to_msgpack

  File.binwrite('save.txt',msg)

  puts "Game has been saved"
  puts "Good Bye"
  exit(0)

end

def load_game

  msg = File.binread('save.txt')
  obj = MessagePack.unpack(msg)

  @failures = obj['failures']
  @incorrect_letters = obj['incorrect_letters']
  @guesses = obj['guesses']
  @game_word = obj['game_word']
  @game_word_array = obj['game_word_array']
  @hidden_word = obj['hidden_word']
  @guessed_letters = obj['guessed_letters']

  File.delete('save.txt')

end

hangman