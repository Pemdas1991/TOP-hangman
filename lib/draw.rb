def draw(failures)
  #system("clear")
  hang_array = ["
    +----+     Guesses: #{@guesses}
    |    |
    |    
    |   
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |
    |    0
    |   
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |
    |    0
    |    |
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |
    |    0
    |   /|
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |
    |    0
    |   /|\
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |
    |    0
    |   /|\
    |   / 
    | 
    ========",  
    "
    +----+     Guesses: #{@guesses}
    |    |
    |    0
    |   /|\
    |   / \
    | 
    ========"]
    puts hang_array[failures]
end