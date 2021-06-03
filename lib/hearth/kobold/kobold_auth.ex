defmodule Hearth.KoboldAuth do
  use HTTPoison.Base

  def process_url(url), do: Hearth.create_auth_url(url)

  def process_request_headers(headers) do
    h = [
      {"Accept", "application/json"},
      {"Content-Type", "application/json"}
    ]

    headers ++ h
  end
end
