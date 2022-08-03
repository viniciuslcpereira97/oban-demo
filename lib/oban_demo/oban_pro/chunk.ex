defmodule MyApp.ChunkWorker do
  use Oban.Pro.Workers.Chunk, queue: :messages, size: 100, timeout: 1000

  @impl true
  def process([_ | _] = jobs) do
    jobs
    |> Enum.map(& &1.args)
    |> MyApp.Messaging.send_batch()

    :ok
  end
end
