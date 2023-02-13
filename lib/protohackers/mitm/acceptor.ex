defmodule Protohackers.MITM.Acceptor do
  use Task, restart: :transient # not ended gracefully <=> restarted

  require Logger

  def start_link([] = _opts) do
    Task.start_link(__MODULE__, :run, [])
  end

  def run do
    listen_options = [
      :binary,
      ifaddr: {0, 0, 0, 0},
      # active: true, # events sent to controlling process via erlang messages
      active: :once, # active only for 1 message, then we have to set to active again
      # useful for back-pressure as we will decide ourselves when to be active again
      # otherwise erlang messages could pile up and overflow
      packet: :line,
      reuseaddr: true
    ]

    case :gen_tcp.listen(5006, listen_options) do
      {:ok, listen_socket} ->
        Logger.info("MITM server listening on port 5006")
        accept_loop(listen_socket)

      {:error, reason} ->
        raise "failed to listen on port 5006: #{inspect(reason)}"
    end
  end

  defp accept_loop(listen_socket) do
    case :gen_tcp.accept(listen_socket) do
      {:ok, socket} ->
        {:ok, _} = Protohackers.MITM.ConnectionSupervisor.start_child(socket)
        accept_loop(listen_socket)

      {:error, reason} ->
        raise "failed to accept connection: #{inspect(reason)}"
    end
  end


end
