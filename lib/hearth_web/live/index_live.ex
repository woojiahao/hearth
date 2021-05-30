defmodule HearthWeb.IndexLive do
  use HearthWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, hash: nil, error: nil)}
  end

  @impl true
  def handle_event("shorten", %{"form" => %{"original" => original}}, socket) do
    # TODO: Add validation for original
    case Hearth.KoboldUrl.shorten(original) do
      {:ok, hash} ->
        {:noreply, assign(socket, hash: Hearth.create_redirect_url(hash), error: nil)}

      {:error, reason} ->
        {:noreply, assign(socket, hash: nil, error: reason)}
    end
  end
end
