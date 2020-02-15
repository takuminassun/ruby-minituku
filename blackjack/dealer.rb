# ディーラークラス
class Dealer

  def initialize
    @dealer_hands = []
  end

  # 最初のドローおよび手札公開
  def first_draw(deck)
    2.times do
      card = deck.draw_card
      @dealer_hands.push(card)
    end

    puts "--- ディーラーの手札 ---"
    puts "1枚目: #{@dealer_hands.first.show}"
    puts "2枚目: 伏せられている"
    puts "---------------------"
  end

  # 得点計算
  def score_count
    score = 0
    @dealer_hands.each do |hand|
      score += hand.count
    end
    return score
  end

  # 一枚引く
  def draw(deck, player)
    card = deck.draw_card
    @dealer_hands.push(card)
    puts "ディーラーはカードを引きました"
  end

end