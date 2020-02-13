def run_game
  deck = Deck.new
  deck.shuffle
  plyayer = Player.new
  plyayer.firts_draw(deck)
  plyayer.score_count
  dealer = Dealer.new
  dealer.firts_draw(deck)
  dealer.score_count

  while true do
    number = rand(11)
    if number == 3 && (player.instance_variable_get :@hands).length >= 3 && player.score_count >= 11 &&plyayer.score_count != 21
      puts "山札が輝き出した！\n山札を信じて引きますか[y/n]"
      puts "あなたの得点: #{player.score_count}"
      answer = gets.chomp.to_s
      if answer == "Y" || answer == "y"
        player.setiny_draw(deck, player)
        unless blackjack?(player)
          break
        end
      elsif answer == "N" || answer == "n"
        puts "さらにカードを引きますか[y/n]"
        puts "あなたの得点: #{player.score_count}"
        answer = gets.chomp.to_s
        puts "Answer: #{answer}"
        if answer == "Y" || answer == "y"
          player.draw(deck, player)
          unless burst?(player)
            exit
          end
          unless blackjack?(player)
            break
          end
        elsif answer == "N" || answer == "n"
          break
        else
          puts "無効な値です。もう一度入力してください。"
        end
      else
        puts "さらにカードを引きますか？[y/n]"
        puts "あなたの得点: #{player.score_count}"
        answer = gets.chomp.to_s
        puts "Answer: #{answer}"
        if answer == "Y" || answer "y"
          player.draw(deck, player)
          unless burst?(player)
            exit
          end
          unless blackjack?(player)
            break
          end
        elsif answer == "N" || answer == "n"
          break
        else
          puts "無効な値です。もう一度入力してください"
        end
      end
    end

    while true do
      if dealer.score_count < 17
        dealer.draw(deck, dealer)
      else
        break
      end
    end

    judge(player, dealer)
  end
end

def judge(player, dealer)
  player_score = player.score_count
  dealer_score = dealer.score_count
  puts "---あなたの得点---"
  puts "#{player_score}"
  puts "---ディーラーの得点---"
  puts "#{dealer_score}"
  if dealer.score_count == player_score
    puts "引き分け"
  elsif player_score == 21
    puts "ブラックジャック!\nあなたの勝ちです!"
  elsif dealer_score == 21
    puts "ディーラーのブラックジャック!\nあなたの負けです..."
  elsif dealer_score > 21
    puts "ディーラーはバーストしました。"
    puts "あなたの勝ちです！"
  elsif dealer_score > player_score
    puts "あなたの負けです..."
  elsif dealer_score < player_score
    puts "あなたの勝ちです！"
  end
end

def burst?(player)
  if player.score_count <= 21
    return true
  else
    puts "あなたの得点: #{player.score_count}"
    puts "バーストしました。あなたの負けです。"
    return false
  end
end

def blackjack?(player)
  if player.score_count == 21
    return false
  else
    return true
  end
end

puts "-----------------------"
puts "ブラックジャックへようこそ！"
puts "-----------------------"

run_game