defmodule NoteAppWeb.NotesNewLive do
  use NoteAppWeb, :live_view
  alias NoteApp.Notes.NoteServer
  alias NoteAppWeb.NotesIndexLive

  def mount(_params, _session, socket) do
    socket = assign(socket, title: "", body: "")
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div class="note">
      <div class="note-header">
        <h3>
          <%= live_patch "<", to: Routes.live_path(@socket, NotesIndexLive) %>
        </h3>
        <button type="submit" form="create-note-form">Done</button>
      </div>

      <form id="create-note-form" phx-change="detect_change" phx-submit="save_note">
        <input type="text" placeholder="Add Title" value="<%= @title %>" name="title"/>
        <br>
        <br>
        <textarea placeholder="Add note" name="body"><%= @body %></textarea>
      </form>
    </div >
    """
  end

  def handle_event("detect_change", %{"title" => title, "body" => body}, socket) do
    {:noreply, assign(socket, title: title, body: body)}
  end

  def handle_event("save_note", _value, socket) do
    new_note = %{id: nil, title: socket.assigns.title, body: socket.assigns.body}
    NoteServer.create_note(new_note)
    {:noreply,
         socket
         |> redirect(to: "/")
    }
  end
end
