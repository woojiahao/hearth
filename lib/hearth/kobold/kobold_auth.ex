defmodule Hearth.KoboldAuth do
  use Hearth.KoboldBase, url_func: &Hearth.create_auth_url/1

  def login(username, password) do
  end
end
