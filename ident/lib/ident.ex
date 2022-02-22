defmodule Ident do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  @spec build_grid(any) :: list
  def build_grid(%Ident.Image{hex: hex} = image) do
    hex
    |> Enum.chunk_every(3)
    
  end

  def miror_rows(rows) do
    [first,second | _tail] = rows
    rows ++ [second,first]
  end

  def pick_color(%Ident.Image{hex: [r, g, b | _tail]} = image) do
    %Ident.Image{image | color: {r, g, b}}
  end

  # how  the above  function will look like writen in JS
  # let pick_colour = function(image) {
  #     image.color = {
  #         r: image.hex[0],
  #           g: image.hex[1],
  #           b: image.hex[2] ;
  #       }
  #       return image;
  # }

  @spec hash_input(any) :: %Ident.Image{hex: [byte]}
  def hash_input(input) do
    %Ident.Image{
      hex:
        :crypto.hash(:sha256, input)
        |> :binary.bin_to_list()
    }
  end
end
