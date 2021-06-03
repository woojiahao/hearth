defmodule Hearth.KoboldBase do
  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      use HTTPoison.Base

      url_func = Keyword.get(opts, :url_func)

      def process_url(url), do: unquote(url_func).(url)

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
  end
end
