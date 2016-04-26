# Twenty One Game

require "pry"

DECK  = [
  ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], 
  ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'],
  ['H', 'Q'], ['H', 'K'], ['H', 'A'], ['C', '2'], ['C', '3'],
  ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'],
  ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], 
  ['C', 'A'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'],
  ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'],
  ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A'], ['D', '2'],
  ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], 
  ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'],
  ['D', 'K'], ['D', 'A']
]

def initialize_deck(deck)
  shuffled_deck = []
  (1..52).each do |item|
    shuffled_deck << deck.sample
  end
  shuffled_deck
end

def get_suit(card)
  suit = ""
  case card[0]
  when 'H'
    suit = "Hearts"
  when 'S'
    suit = "Spades"
  when 'D'
    suit = "Diamonds"
  else 
    suit = "Clubs"
  end
end

def get_value(card)
  value = ""
  if card[1].to_i == 0
    if card[1] == 'J' || card[1] == 'Q' || card[1] == 'K'
      value = 10
    end
  else 
    value = card[1].to_i
  end
  
  value
end

def hit_deck(player, deck)
  card = nil
  card = deck.sample
  player << card
  
  puts "You pulled a #{card[1]} of #{get_suit(card)} with a value of #{get_value(card)}"
  
  nil
end

def stay_deck(player)
  alternate_player(player)
  puts "Staying, turn passed to next player."
end

def alternate_player(player)
  player = 
end

def calculate_total(player)
  total = 0
  player.each do |card|
    binding.pry
    total += get_value(card)
  end
  
  total
end

game_deck = initialize_deck(DECK)
player = []
dealer = []



binding.pry 


