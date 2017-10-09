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
   return index = -1
 end
  input = input.to_i
  until input.between?(1,9)
    turn(board)
    input = input.to_i
  end
    return index = input - 1
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
  index = input_to_index(input)
  if valid_move?(index) != true
    puts "Please enter 1-9:"
    input = gets.strip
  else
    move(index,current_player)
    display_board(board)
  end
end

def won?(board = @board)
  WIN_COMBINATIONS.each do |win_index|
    board_subarray = []
     win_index.each do |position|
       board_subarray << board[position]
     end
   if board_subarray.all?{|letters| letters == "X"} || board_subarray.all?{|letters| letters == "O"}
     return win_index
   end
  end
 return nil
end


def full?(board = @board)
 if @board.all?{|letters| letters == "X" || letters == "O"}
   return true
 else
   return false
 end
end

def draw?

end

def over?

end

def winner(board = @board)

end

def play(board = @board)

end

end
