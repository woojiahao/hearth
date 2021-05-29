defmodule Hearth.KoboldUrl do
  # TODO: Assess if this needs to be a GenServer
  use HTTPoison.Base

  def shorten(url) do
    # TODO: Allow other options to be used but tie them to a user account like expiration date using dashboard to control
    case request_(:post, "create", %{"original" => url}) do
      {:ok, body} -> {:ok, body["message"]}
      {:error, error} -> {:error, error}
    end
  end

  def request_(:post, url, body) do
    case post(url, body) do
      {:ok, %HTTPoison.Response{status_code: code, body: body}} when code in 200..299 ->
        {:ok, body}

      {:ok, %HTTPoison.Response{body: body}} ->
        error = body |> Map.get("error", body |> Map.get("errors", ""))
        {:error, error}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def process_url(url) do
    base = Application.get_env(:hearth, :api_path)
    # TODO: Properly generate URL
    base <> "/" <> url
  end

  def process_request_headers(headers) do
    h = [
      {"Accept", "application/json"},
      {"Content-Type", "application/json"}
    ]

    headers ++ h
  end

  def process_request_body(body), do: Jason.encode!(body)
  def process_response_body(body), do: Jason.decode!(body)
end
