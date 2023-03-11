def draw(failures)
  clear
  hang_array = ["
    +----+     Guesses: #{@guesses}
    |    |     #{@incorrect_letters}
    |    
    |   
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |     #{@incorrect_letters}
    |    0
    |   
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |     #{@incorrect_letters}
    |    0
    |    |
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |     #{@incorrect_letters}
    |    0
    |   /|
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |     #{@incorrect_letters}
    |    0
    |   /|\\
    |   
    | 
    ========",
    "
    +----+     Guesses: #{@guesses}
    |    |     #{@incorrect_letters}
    |    0
    |   /|\\
    |   / 
    | 
    ========",  
    "
    +----+     Guesses: #{@guesses}
    |    |     #{@incorrect_letters}
    |    0
    |   /|\\
    |   / \\
    | 
    ========"]
    puts hang_array[failures]
end


