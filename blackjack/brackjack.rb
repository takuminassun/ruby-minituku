require './card'
require './deck'
require './player'
require './dealer'

# ゲームの進行
def run_game(count)
  # 初期手札2枚の準備,手札公開,得点表示
  deck = Deck.new
  deck.shuffle
  player = Player.new
  player.first_draw(deck)
  player.score_count
  dealer = Dealer.new
  dealer.first_draw(deck)
  dealer.score_count
  #ユーザーのターン
  while true do
    number = rand(11)
    puts
    puts "さらにカードを引きますか？[y/n]"
    puts "あなたの得点: #{player.score_count}"
    answer = gets.chomp.to_s
    puts "Answer: #{answer}"
    if answer == "Y" || answer == "y"
      player.draw(deck, player)
      unless burst?(player)
        return true
      end
      unless blackjack?(player)
        break
      end
    elsif answer == "N" || answer == "n"
      break
    else
      puts "無効な値です。もう一度入力してください。"
    end
  end

  #ディーラーのターン
  while true do
    if dealer.score_count < 17
      dealer.draw(deck, dealer)
    else
      break
    end
  end
  # 勝敗判定
  player_score = player.score_count
  dealer_score = dealer.score_count
  
  puts
  puts "----- あなたの得点 -----"
  puts "#{player_score}"
  puts "--- ディーラーの得点 ---"
  puts "#{dealer_score}"
  puts
  if dealer.score_count == player_score
    puts "引き分け"
  elsif player_score == 21
    puts "ブラックジャック！\nあなたの勝ちです！"
    return "win"
  elsif dealer_score == 21
    puts "ディーラーのブラックジャック！\nあなたの負けです..."
  elsif dealer_score > 21
    puts "ディーラーはバーストしました。\nあなたの勝ちです！"
    return "win"
  elsif dealer_score > player_score
    puts "あなたの負けです..."
  elsif dealer_score < player_score
    puts "あなたの勝ちです！"
    return "win"
  end
end

# バーストしたか？
def burst?(player)
  if player.score_count <= 21
    return true
  else
    puts
    puts "あなたの得点: #{player.score_count}"
    puts "バーストしました。あなたの負けです。"
    return false
  end
end

# ブラックジャックかどうか
def blackjack?(player)
  if player.score_count == 21
    return false
  else
    return true
  end
end

puts "---------------------"
puts "ブラックジャックへようこそ！"
puts "---------------------"
puts
count = 0
victory = 0
while true do
  puts "-------------------------"
  puts "---試合数: #{count}戦---"
  puts "---勝利数: #{victory}勝---"
  puts "-------------------------"
  puts "---0: 対戦する---"
  puts "---1: 終了する---"
  
  case gets.to_i
  when 0
    result = run_game(count)
    if result == "win"
      victory += 1
    end
    count += 1
  when 1
    exit
  else
    puts "無効な値です"
  end
end
