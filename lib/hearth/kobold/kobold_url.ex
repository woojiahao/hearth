defmodule Hearth.KoboldUrl do
  # TODO: Assess if this needs to be a GenServer
  @moduledoc """
  This module is a wrapper around the kobold URL service. In order to simplify the work, HTTPoison.Base is used where
  callbacks are defined to help with standardising headers and URLs. The requests are also simplified by curating how
  the processing of requests after they have been passed through the various callbacks
  """
  use Hearth.KoboldBase, url_func: &Hearth.create_redirect_url/1

  def shorten(url) do
    # TODO: Allow other options to be used but tie them to a user account like expiration date using dashboard to control
    case post_("create", %{"original" => url}) do
      {:ok, body} -> {:ok, body["message"]}
      {:error, error} -> {:error, error}
    end
  end

  def post_(url, body) do
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
end
