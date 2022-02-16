defmodule Ident do
  def main (input) do
      input
      |> hash_input
  end

  def hash_input(input) do
    :crypto.hash(:sha256, input)
    |> :binary.bin_to_list
  end
end
