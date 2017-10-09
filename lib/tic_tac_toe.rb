class TicTacToe

 def initialize(board = nil)
  @board = board || Array.new(9, " ")
 end

WIN_COMBINATIONS = [
 [0,1,2], # top row
 [3,4,5], # middle row
 [6,7,8], # bottom row
 [0,4,8], # left diagonal
 [2,4,6], # right diagonal
 [0,3,6], # vertical left
 [1,4,7], # vertical middle
 [2,5,8] # vertical right
]

def display_board(board = @board)
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(input)
 unless input =~ /\d/
   @index = -1
 end
  input = input.to_i
  until input.between?(1,9)
    turn(board)
    input = input.to_i
  end
    @index = input - 1
end

def move(index = @index, token = @token || @token="X")
 @board[index] = token
end

def position_taken?(index = @index)
 !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index = @index)
 if position_taken?(index) == false && index.between?(0,8) == true
    return true
 elsif index.between?(0,8) == false
    return false
 end
end

def turn_count(board = @board)
  @board.count{|token| token == "X" || token == "O"}
end

def current_player(board = @board)
 turn_count % 2 == 0 ? "X" : "O"
end

#left off here...need to fix #turn
def turn(board = @board)
  puts "Please enter 1-9:"
  input = gets.strip
  input_to_index(input)
  test_valid = valid_move?(index)
  if test_valid != true
    puts "Please enter 1-9:"
    input = gets.strip
  else
    move(index,current_player)
    display_board(board)
  end
end



end
