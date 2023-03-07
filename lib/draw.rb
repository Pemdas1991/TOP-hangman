def draw(failures)
  system('clear')
  hang_array = ['
    +----+
    |    |
    |    
    |   
    |   
    | 
    ========',
    '
    +----+
    |    |
    |    0
    |   
    |   
    | 
    ========',
    '
    +----+
    |    |
    |    0
    |    |
    |   
    | 
    ========',
    '
    +----+
    |    |
    |    0
    |   /|
    |   
    | 
    ========',
    '
    +----+
    |    |
    |    0
    |   /|\
    |   
    | 
    ========',
    '
    +----+
    |    |
    |    0
    |   /|\
    |   / 
    | 
    ========',  
    '
    +----+
    |    |
    |    0
    |   /|\
    |   / \
    | 
    ========']
    puts hang_array[failures]
end