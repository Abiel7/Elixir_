defmodule AppWeb.ItemView do
  use AppWeb, :view

  def complete(item) do
    case item.status do 
    1 -> "completed"
    _ -> ""
    end 
  end

  def checked(item) do
    case item.status do
      1 -> "checked"
      _ -> "" 
    end 
  end
end
