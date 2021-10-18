defmodule NoteAppWeb.PageController do
  use NoteAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
