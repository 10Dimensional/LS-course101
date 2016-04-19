# Tic Tac Toe Game

require "pry"

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [
    [1, 2, 3], 
    [4, 5, 6], [7, 8, 9], [1, 4, 7], 
    [2, 5, 8], [3, 6, 9], [1, 5, 9],
    [3, 5, 7]
  ]

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system('clear') || system('cls')
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(brd, player)
  square = nil
  
  if player == "player"
    loop do
      prompt "Choose a position to place a piece: #{joiner(empty_squares(brd), ', ')}"
      square = gets.chomp.to_i
      
      break if empty_squares(brd).include?(square)
      prompt "Sorry, that's not a valid choice."
    end
    brd[square] = PLAYER_MARKER
  else 
    #offense

    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
    
    #defense
    
    if !square
      WINNING_LINES.each do |line|
        square = find_at_risk_square(line, brd, PLAYER_MARKER)
        break if square
      end
    end
    
    # choose 5 
    if !square && square_5_available(brd) == 5
      square = square_5_available(brd)
    else 
      square = empty_squares(brd).sample
    end
    
    brd[square] = COMPUTER_MARKER
  end
  
end

def board_full?(brd)
  empty_squares(brd).empty? # is actually full lol
end

def someone_won?(brd)
  !!detect_winner(brd) # forces value to boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
   # binding.pry
    
    if brd[line[0]] == PLAYER_MARKER && 
       brd[line[1]] == PLAYER_MARKER && 
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER && 
          brd[line[1]] == COMPUTER_MARKER && 
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end # end if loop
  end #end do loop
  nil
end

# Bonus feature 1 -- try on my own

def joiner(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

# Bonus feature 2 

def num_games_won(scores)
  scores.values.each do |value| 
    break value == 5 ? true : false
  end
end

# Bonues feature 3/4 

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select {|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

# Bonus feature 5

def square_5_available(brd)
  5 if empty_squares(brd).include?(5) 
end

# Bonus feature 6 

def alternate_player(player)
  next_player = ""
  if player == "player"
    next_player = "computer"
  elsif player == "computer"
    next_player = "player"
  end
  next_player
    
end

scores = {player_score: 0, comp_score: 0}

current_player = "player"
  
loop do
  
  board = initialize_board
  display_board(board)
  
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
  
  display_board(board)
  
  if someone_won?(board)
    if detect_winner(board) == "Player"
      scores[:player_score] += 1
      prompt("#{detect_winner(board)} won!")
    elsif detect_winner(board) == "Computer"
      scores[:comp_score] += 1
      prompt("#{detect_winner(board)} won!")
    end
  else
    prompt("It's a tie!")
  end
  
  if num_games_won(scores) == true
     if scores[:player_score] == 5
        puts "Player has won 5 games!"
     else 
        puts "Computer has won 5 games!"
     end
  end
  
  prompt("Do you want to play again? (Y/N)")
    answer = gets.chomp
    break unless answer.downcase().start_with?('y')
end

prompt("Thanks for playing, goodbye!")

