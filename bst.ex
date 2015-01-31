defmodule Bst do
  def start(val), do: spawn(fn -> loop val end)

  def add(pid, val) do
    send pid, {:add, val}
  end

  def contains(pid, val) do
    send pid, {self, {:contains, val}}
    receive do res -> res end
  end

  defp check_tree(tree, value, sender) do
    if !tree do
      notify_sender_not_found sender
    else
      send tree, {sender, {:contains, value}}
    end
  end

  defp notify_sender_not_found(sender) do
    notify_sender sender, false
  end

  defp notify_sender_found(sender) do
    notify_sender sender, true
  end

  defp notify_sender(sender, found) do
    send sender, found
  end

  defp loop(val), do: loop(val, nil, nil)
  defp loop(val, left, right) do
    receive do
      {sender, {:contains, value}} ->
        cond do
          val == value ->
            notify_sender_found sender
          val > value ->
            check_tree left, value, sender
          val < value ->
            check_tree right, value, sender
        end
      {:add, value} ->
        goes_in_right_tree? = (val < value)
        goes_in_left_tree?  = (val > value)
        no_right_tree?      = (right == nil)
        no_left_tree?       = (left == nil)

        cond do
          goes_in_right_tree? ->
            if no_right_tree? do
              right = Bst.start value
            else
              add right, value
            end
          goes_in_left_tree? ->
            if no_left_tree? do
              left = Bst.start value
            else
              add left, value
            end
        end
    end
    loop val, left, right
  end

  def test do
    root = Bst.start 10_000
    result = Bst.contains root, 10_000
    IO.puts "#{result}"

    Bst.add root, 100
    result = Bst.contains root, 100
    IO.puts "#{result}"

    result = Bst.contains root, 10 #fail
    IO.puts "#{result}"
  end
end

Bst.test

