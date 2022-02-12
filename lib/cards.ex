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

    # option  two

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_siz) do
    Enum.split(deck, hand_siz)

    # returns a tuple  with two  elements
  end

  def save(deck, fileName) do
    binary = :erlang.term_to_binary(deck)

    File.write(fileName, binary)
    # File.write("#{fileName}.txt", binary)
  end

  def load(fileName) do
    # option  1
    # {status, content} = File.read(fileName)
    # case status do
    #   :ok -> :erlang.binary_to_term(content)
    #   :error -> "The file  #{fileName}  could not be read"
    # end

    # option  2
    case File.read!(fileName) do
      {:ok,binary } -> :erlang.binary_to_term binary
      {:error, _message } -> "The file  #{fileName}  could not be read"
    end
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
{hands, rest} = Cards.deal(Cards.create_dec() |> Cards.shuffle(), 2)
fileName = "myfile"
# every time  you see  = think about  the  pattern  matching
