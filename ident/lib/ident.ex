defmodule Ident do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def pick_color(image) do
    %Ident.Image{hex: [r, g, b | _tail]} = image

  # Do not modify  existing data  always create a new record 
    %Ident.Image{image | color: {r, g, b}}
  end

  @spec hash_input(any) :: %Ident.Image{hex: [byte]}
  def hash_input(input) do
    %Ident.Image{
      hex:
        :crypto.hash(:sha256, input)
        |> :binary.bin_to_list()
    }
  end
end
