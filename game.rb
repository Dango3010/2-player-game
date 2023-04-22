class Game

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @game_over = false
    @p1 = 0 #player1's points, 3/3 = lose 
    @p2 = 0 #player2's points
  end

  def play
    while !@game_over
      questions
      switch_player
    end
    puts "GAME OVER! HOPE TO NOT SEE U AGAIN!"
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def questions
    a = rand(0..20)
    b = rand(0..20)

    puts "#{@current_player}: What does #{a} plus #{b} equal?"
    print "> "
    answer = $stdin.gets.chomp.to_i

    if answer == a + b
      puts "YES! You are correct. Well done!",
      "P1: #{@p1}/3 vs P2: #{@p2}/3",
      "___NEW TURN___" 
    else
      puts "Yaiks! No! You suck!"
      lose_life
    end

  end 

  def lose_life
    if @current_player == @player1 &&  @p1 != 3 && @p2 != 3
      @p2 += 1
      
      if @p2 == 3 
        puts "player1 wins with the score of #{@p1}/3!"
        @game_over = true
      else 
        puts "P1: #{@p1}/3 vs P2: #{@p2}/3",
        "___NEW TURN___"
      end 

    elsif @current_player == @player2 &&  @p1 != 3 && @p2 != 3
      @p1 += 1
      
      if @p1 == 3 
        puts "player2 wins with the score of #{@p2}/3!"
        @game_over = true
      else 
        puts "P1: #{@p1}/3 vs P2: #{@p2}/3",
        "___NEW TURN___"
      end

    end

  end
  
end

game = Game.new('player1', 'player2')
game.play