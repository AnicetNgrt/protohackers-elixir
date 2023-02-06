defmodule Protohackers.BudgetChatServerTest do
  use ExUnit.Case

  test "whole flow" do
    {:ok, socket1} =
      :gen_tcp.connect(~c"localhost", 5004, mode: :binary, active: false, packet: :line)

    {:ok, socket2} =
      :gen_tcp.connect(~c"localhost", 5004, mode: :binary, active: false, packet: :line)

    assert {:ok, "What's your username?\n"} = :gen_tcp.recv(socket1, 0, 5_000)
    :ok = :gen_tcp.send(socket1, "Anicet\n")
    assert {:ok, "* The room contains: \n"} = :gen_tcp.recv(socket1, 0, 5_000)

    assert {:ok, "What's your username?\n"} = :gen_tcp.recv(socket2, 0, 5_000)
    :ok = :gen_tcp.send(socket2, "Jean\n")
    assert {:ok, "* The room contains: Anicet\n"} = :gen_tcp.recv(socket2, 0, 5_000)
    assert {:ok, "* Jean has entered the room\n"} = :gen_tcp.recv(socket1, 0, 5_000)

    :ok = :gen_tcp.send(socket1, "Hello World!\n")
    assert {:ok, "[Anicet] Hello World!\n"} = :gen_tcp.recv(socket2, 0, 5_000)

    :ok = :gen_tcp.send(socket2, "Hi to you!\n")
    assert {:ok, "[Jean] Hi to you!\n"} = :gen_tcp.recv(socket1, 0, 5_000)

    :gen_tcp.close(socket2)

    assert {:ok, "* Jean left\n"} = :gen_tcp.recv(socket1, 0, 5_000)

    {:ok, socket3} =
      :gen_tcp.connect(~c"localhost", 5004, mode: :binary, active: false, packet: :line)

    assert {:ok, "What's your username?\n"} = :gen_tcp.recv(socket3, 0, 5_000)
    :ok = :gen_tcp.send(socket3, "Michel\n")
    assert {:ok, "* The room contains: Anicet\n"} = :gen_tcp.recv(socket3, 0, 5_000)
  end
end
