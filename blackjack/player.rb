# プレイヤークラス
class Player

  def initialize
    @hands = []
  end

  # 最初のドローおよび手札公開
  def first_draw(deck)
    2.times do
      card = deck.draw_card
      @hands.push(card)
    end

    puts "----- あなたの手札 -----"
    @hands.each_with_index do |hand, i|
      puts "#{i+1}枚目: #{hand.show}"
    end
    puts "------------------------"
  end

  # 得点計算
  def score_count
    score = 0
    @hands.each do |hand|
      score += hand.count
    end
    return score
  end

  # 一枚引く
  def draw(deck, player)
    card = deck.draw_card
    @hands.push(card)
    puts
    puts "あなたが引いたカードは#{card.show}です"
    puts "----- あなたの手札 -----"
    @hands.each do |hand|
      puts "[ #{hand.show} ]"
    end
    puts "------------------------"
  end

# デスティニードロー
  def destiny_draw(deck, player)
    card = deck.destiny_draw_card(player)
    draw(deck, player)
  end

end