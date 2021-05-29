defmodule HearthWeb.PageLive do
  use HearthWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, [])}
  end

  @impl true
  def handle_event("shorten", _value, socket) do
    case Hearth.KoboldUrl.shorten("http://woojiahao.github.io") do
      {:ok, hash} -> IO.puts(hash)
      {:error, reason} -> IO.inspect(reason)
    end

    {:noreply, assign(socket, [])}
  end
end
