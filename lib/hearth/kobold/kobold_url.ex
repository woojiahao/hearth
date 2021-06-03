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
    case post?("create", %{"original" => url}) do
      {:ok, body} -> {:ok, body["message"]}
      {:error, error} -> {:error, error}
    end
  end
end
