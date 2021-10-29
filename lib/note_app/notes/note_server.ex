defmodule NoteApp.Notes.NoteServer do
  # alias NoteApp.Notes.Note
  use GenServer

  # Client
  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def create_note(pid, note) do
    GenServer.cast(pid, {:create_note, note})
  end

  def get_note(pid, id) do
    GenServer.call(pid, {:get_note, id})
  end

  def delete_note(pid, id) do
    GenServer.cast(pid, {:delete_note, id})
  end

  # Server
  @impl true
  def init(notes) do
    {:ok, notes}
  end

  @impl true
  def handle_cast({:create_note, note}, notes) do
    updated_note = add_id(notes, note)
    updates_notes = [updated_note | notes]
    {:noreply, updates_notes}
  end

  @impl true
  def handle_cast({:delete_note, id}, notes) do
    updated_notes = notes |> Enum.reject(fn note -> Map.get(note, :id) == id end)
    {:noreply, updated_notes}
  end

  @impl true
  def handle_call({:get_note, id}, _from, notes) do
    found_note = notes |> Enum.filter(fn note -> Map.get(note, :id) == id end) |> List.first
    {:reply, found_note, notes}
  end

  defp add_id(notes, note) do
    id = (notes |> Kernel.length) + 1
    %{note | id: id}
  end
end
