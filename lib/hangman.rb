require_relative 'draw.rb'


def pick_word
  word = ""
  word_list = File.readlines('google-10000-english-no-swears.txt')
  seed = Random.new
  while word.length <=5 || word.length > 11
    word = word_list[seed.rand(word_list.length)]
    word
  end
end


def new_game
  word = pick_word()
end

def load_game

end

def hangman

  in_progress = false
  failures = 0
  guesses = 0
  guessed_letter = Array.new
  game_word = ""
  hidden_word = Array.new

  p 'Welcome to hang man!'

  while !in_progress

    p 'Type 1 to start a new game,'
    p 'Type 2 to load a saved game,'
    game_type = gets.chomp

    if game_type.to_i == 1
      in_progress = true
      new_game
    elsif game_type.to_i == 2
      puts 'Loading not yet implemented try again'
    else
      system('clear')
     puts 'Try Again'
    end
  end

  
   puts game_type
  
  
  while in_progress

    draw[failures]

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