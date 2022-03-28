defmodule Ident do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd
    |> build_image
    |> draw_image
    |> save_image
  end

  

  # draw image using erlang graphical drawer
  def draw_image(%Ident.Image{color: color, pixel_map: pixel_map}) do
      image = :egd.create(250,250)
      fill = :egd.color(color)

      Enum.each(pixel_map, fn({start,stop})->
          :edg.filedRectangel(image, start, stop, fill)
      end )

      :edg.render(image)

  end

  # build image
  # rem(index,50) * 50 ->
  # div(index,50) * 50  \>
  def build_image(%Ident.Image{grid: grid} = image) do
    pixel_map =
      Enum.map(grid, fn {_x, index} ->
        horizontal = rem(index, 5) * 50
        vertical = div(index, 5) * 50

        top_left = {horizontal, vertical}
        bottom_right = {horizontal + 50, vertical + 50}

        {top_left, bottom_right}
      end)

    %Ident.Image{image | pixel_map: pixel_map}
  end

  def filter_odd(%Ident.Image{grid: grid} = image) do
    grid =
      Enum.filter(grid, fn {code, _index} ->
        rem(code, 2) == 0
      end)

    %Ident.Image{image | grid: grid}
  end

  @spec build_grid(any) :: list
  def build_grid(%Ident.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk_every(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten()
      |> Enum.with_index()

    %Ident.Image{image | grid: grid}
  end

  def mirror_row(rows) do
    [first, second | _tail] = rows
    rows ++ [second, first]
  end

  def pick_color(%Ident.Image{hex: [r, g, b | _tail]} = image) do
    %Ident.Image{image | color: {r, g, b}}
  end

  # how  the above  function would look like  writen in js
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
