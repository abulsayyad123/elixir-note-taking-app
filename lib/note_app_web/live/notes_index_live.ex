defmodule NoteAppWeb.NotesIndexLive do
  use NoteAppWeb, :live_view

  alias NoteApp.Note

  def mount(_params, _session, socket) do
    all_notes = [ %Note{id: 1, title: "First Note", body: "First Post Body",timestamp: '15:06:30.841634Z' } , %Note{id: 2, title: "Second Note", body: "Second Post Body",timestamp: '15:06:30.841634Z'} ]
    {:ok, assign(socket, :notes, all_notes)}
  end

  def render(assigns) do
    ~L"""
      <div class="notes">
        <div class="notes-header">
            <h2 class="notes-title">&#9782; Notes</h2>
            <p class="notes-count">2</p>
        </div>

        <div class="notes-list">
          <%= for note <- @notes do %>
            <div class="notes-list-item">
              <h3><%= note.title %></h3>
              <p><%= note.body %></p>
            </div>
          <% end %>
        </div>
      </div >
    """
  end
end
