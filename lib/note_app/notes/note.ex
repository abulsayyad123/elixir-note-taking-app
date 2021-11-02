defmodule NoteApp.Notes.Note do
  def subscribe() do
    Phoenix.PubSub.subscribe(NoteApp.PubSub, "notes")
  end

end
