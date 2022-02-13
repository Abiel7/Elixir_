defmodule Cards do
  @moduledoc """
  This module provides simple functions for creating and handling deck  of cards  .
  """

  @doc """
  Creates a deck of cards.
  
  
  
  """
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

    # option  two

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffles a deck of cards by using built in  shuffle  function.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Check if card is part  of the deck
  
  ## Examples
  
        iex> deck = Cards.create_dec
        iex> Cards.contains?(deck, "Queen of Hearts")
        true
  
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Draws a card from the dec on given number of `hands_size`
  
  ## Example
  
        iex> deck = Cards.create_dec
        iex> {hands,deck} = Cards.deal(deck, 2)
        iex> hands
        ["Ace of Hearts", "Two of Hearts"]
  
  """
  def deal(deck, hand_siz) do
    Enum.split(deck, hand_siz)
  end

  @doc """
    Saves  deck to a given `fileName` .
  """
  def save(deck, fileName) do
    binary = :erlang.term_to_binary(deck)

    File.write(fileName, binary)
    # File.write("#{fileName}.txt", binary)
  end

  @doc """
  On given  `fileName` it loads  the deck  from the file.
  """
  def load(fileName) do
    # option  1
    # {status, content} = File.read(fileName)
    # case status do
    #   :ok -> :erlang.binary_to_term(content)
    #   :error -> "The file  #{fileName}  could not be read"
    # end

    # option  2
    case File.read(fileName) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _message} -> "The file  #{fileName}  could not be read"
    end
  end

  @doc """
  This function can be seen as the main  function.
  It create deck of cards, shuffles it and then deals  it to  given  `hand_size`.
  """
  def create_hand(hand_size) do
    Cards.create_dec()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end

# start interactive elixir shell by  iex -S mix

# dec = Cards.create_dec
# shuffled = Cards.shuffle(dec)

# IO.puts(shuffled |> Enum.join(" "))

## pattern matching
# two  is pont to hands and the remaining list  to  rest
# Enum.split(dec, 2) returns  a tuple with  two  elemetns,  the list  and  count
# with  count being at index 0 and list at index 1
# {hands, rest} = Cards.deal(Cards.create_dec() |> Cards.shuffle(), 2)

# every time  you see  = think about  the  pattern  matching
