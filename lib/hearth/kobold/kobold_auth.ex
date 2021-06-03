defmodule Hearth.KoboldAuth do
  use Hearth.KoboldBase, url_func: &Hearth.create_auth_url/1

  @type email :: String.t()
  @type password :: String.t()
  @type access_token :: String.t()
  @type refresh_token :: String.t()

  @spec login(email, password) :: {:ok, access_token, refresh_token} | {:error, String.t()}
  def login(email, password) do
    case post?("auth/login", %{"email" => email, "password" => password}) do
      {:ok, body} -> {:ok, body["access_token"], body["refresh_token"]}
      {:error, error} -> {:error, error}
    end
  end
end
