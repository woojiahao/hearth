defmodule HearthWeb.LoginLive do
  use HearthWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, error: nil)}
  end

  @impl true
  def handle_event(
        "login",
        %{"form" => %{"email" => email, "password" => password}},
        socket
      ) do
    IO.inspect(email)
    IO.inspect(password)

    case Hearth.KoboldAuth.login(email, password) do
      {:ok, access_token, refresh_token} ->
        IO.inspect(access_token)
        IO.inspect(refresh_token)
        socket |> Plug.Conn.put_session("access_token", access_token)
        socket |> Plug.Conn.put_session("refresh_token", refresh_token)
        {:noreply, push_redirect(socket, to: "/", replace: true)}

      {:error, error} ->
        IO.inspect(error)
        {:noreply, push_patch(socket, error: error)}
    end
  end
end
