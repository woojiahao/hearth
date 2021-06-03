defmodule Hearth do
  @moduledoc """
  Hearth keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_url_path(), do: Application.get_env(:hearth, :api_path)

  def get_auth_path(), do: Application.get_env(:hearth, :auth_path)

  def create_url(base, endpoint), do: base |> URI.merge(endpoint) |> URI.to_string()

  def create_redirect_url(endpoint), do: create_url(get_url_path(), endpoint)

  def create_auth_url(endpoint), do: create_url(get_auth_path(), endpoint)
end
