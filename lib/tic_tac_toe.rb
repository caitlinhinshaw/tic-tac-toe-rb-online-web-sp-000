WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  occupied_spaces = 0
  board.each do |space|
    if space === "X" || space === "O"
      occupied_spaces += 1
    end
  end
  occupied_spaces
end

def current_player(board)
  # if turn_count(board).even?
  #   "X"
  # else
  #   "O"
  # end
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    if win_combination.all? do |index|
        position_taken?(board, index)
      end
      board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
    end
  end
end

def full?(board)
  board.none? do |index|
    index.nil? || index == " "
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end
