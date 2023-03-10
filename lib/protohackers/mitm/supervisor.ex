defmodule Protohackers.MITM.Supervisor do
  use Supervisor

  def start_link([] = _opts) do
    Supervisor.start_link(__MODULE__, :no_args)
  end

  @impl true
  def init(:no_args) do
    children = [
      Protohackers.MITM.ConnectionSupervisor,
      Protohackers.MITM.Acceptor
    ]
    Supervisor.init(children, strategy: :rest_for_one)
    # :rest_for_one, if top-level children crash, following children stop, not the otherway around
    # here Acceptor depends on ConnectionSupervisor and needs to stop if it crashes
  end
end
