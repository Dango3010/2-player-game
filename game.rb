class Game

  def initialize (player1_name, player2_name)
    @player1 = Players.new(player1_name)
    @player2 = Players.new(player2_name)
    @current_player = @player1.name
    @game_over = false
    @p1 = 3 #player1's points, 3/3 = lose 
    @p2 = 3 #player2's points
  end

  def play
    question = Questions.new(@p1, @p2, @player1, @player2, @current_player, @game_over)

    while !@game_over
      question.question_method
      question.switch_player
    end
    puts "GAME OVER! HOPE TO NOT SEE U AGAIN!"
  end
  
end
