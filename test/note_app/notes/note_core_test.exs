defmodule NoteApp.Notes.NoteCoreTest do
  use ExUnit.Case

  alias NoteApp.Notes.NoteCore

  describe "new/0" do
    test "creates an empty list of notes" do
      assert NoteCore.new() == []
    end
  end

  describe "add_note/2" do
    test "it adds new note to existing notes list" do
      note = %{id: nil, title: "first note", body: "first note body"}

      notes = NoteCore.new()
              |> NoteCore.add_note(note)

      first_note = List.first(notes)
      assert Kernel.length(notes) == 1
      assert first_note.title == note.title
      assert first_note.body == note.body
      assert first_note.id == 1
    end
  end

  describe "get_note_by_id/2" do
    test "it returns notes by id from given the list of notes" do
      note = %{id: nil, title: "first note", body: "first note body"}

      notes = NoteCore.new()
              |> NoteCore.add_note(note)

      assert NoteCore.get_note_by_id(1, notes) == List.first(notes)
    end
  end

  describe "delete_note/2" do
    test "it deletes note by id from the gives list of notes" do
      note = %{id: nil, title: "first note", body: "first note body"}

      notes = NoteCore.new()
              |> NoteCore.add_note(note)

      first_note = List.first(notes)
      assert Kernel.length(notes) == 1
      assert NoteCore.delete_note(first_note.id, notes)
             |> Kernel.length() == 0
    end
  end

  describe "update_note/2" do
    test "it updates the note as per passed note from the given list of notes" do
      note = %{id: nil, title: "first note", body: "first note body"}

      notes = NoteCore.new()
              |> NoteCore.add_note(note)

      updated_param = %{id: 1, title: "updated first note", body: "updated first note body"}
      updated_note = NoteCore.update_note(updated_param, notes)
      assert updated_note.title == updated_param.title
    end
  end
end
