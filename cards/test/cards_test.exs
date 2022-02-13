defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck  of cards" do
    deck_length = length(Cards.create_dec())
    assert deck_length == 52
  end

  test "shuffling the deck  and randomize it" do
    deck_shffuled = Cards.shuffle(Cards.create_dec())
    # assert deck_shffuled != Cards.create_dec()
    refute deck_shffuled == Cards.create_dec()
  end
end
