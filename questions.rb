class Questions

  def initialize (p1, p2, player1, player2, current_player, game_over)
    @player1 = player1
    @player2 = player2
    @current_player = current_player
    @game_over = game_over
    @p1 = p1
    @p2 = p2
  end

  def question_method
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
    if @current_player == @player1.name &&  @p1 != 0 && @p2 != 0
      @p2 -= 1
      
      if @p2 == 0
        puts "player1 wins with the score of #{@p1}/3!"
        @game_over = true
      else 
        puts "P1: #{@p1}/3 vs P2: #{@p2}/3",
        "___NEW TURN___"
      end 

    elsif @current_player == @player2.name &&  @p1 != 0 && @p2 != 0
      @p1 -= 1
      
      if @p1 == 0
        puts "player2 wins with the score of #{@p2}/3!"
        @game_over = true
      else 
        puts "P1: #{@p1}/3 vs P2: #{@p2}/3",
        "___NEW TURN___"
      end

    end
  end

  def switch_player
    @current_player = @current_player == @player1.name ? @player2.name : @player1.name
  end

end