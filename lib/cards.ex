defmodule Cards do

  def create_dec do
    ["Ace","Two","three"]
  end

  def shuffle(deck ) do
      Enum.shuffle(deck)
  end

  def contains?(deck,card) do
    Enum.member?(deck,card)
  end

end

# start interactive elixir shell by  iex -S mix

# dec = Cards.create_dec
# shuffled = Cards.shuffle(dec)

# IO.puts(shuffled |> Enum.join(" "))
