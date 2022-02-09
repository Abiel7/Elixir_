defmodule Cards do
  def create_dec do
    values = [
      "Ace",
      "Two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
      "ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]

    # List comprehension,  for each  element  in suits do somthing
    #  this returns  new

    # option  one
    # cards =
    #   for values <- values do
    #     for suits <- suits do
    #       "#{values} of #{suits}"
    #     end
    #   end

    #   List.flatten(cards)

<<<<<<< HEAD
    # option  two
=======
>>>>>>> 77f4972749544fec70bdf3259df92c2b8ca39ae3
    for suit <-suits,value <- values do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

<<<<<<< HEAD

=======
    
>>>>>>> 77f4972749544fec70bdf3259df92c2b8ca39ae3
end

# start interactive elixir shell by  iex -S mix

# dec = Cards.create_dec
# shuffled = Cards.shuffle(dec)

# IO.puts(shuffled |> Enum.join(" "))
