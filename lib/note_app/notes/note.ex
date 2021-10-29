defmodule NoteApp.Notes.Note do
  @enforce_keys [:title, :timestamp]
  defstruct [:id, :title, :body, :timestamp]

  # We are going to create API layer for:
  # - list_all notes
  # - get_particular note
  # - create note
  # - update note
  # - delete note

  # We will be using dialyzer for strict typing

  # We will create:
  # GenServer for maintaining Notes
  # GenServer will have callbacks for
    # - list_all notes
    # - get_particular note
    # - create note
    # - update note
    # - delete note

end
