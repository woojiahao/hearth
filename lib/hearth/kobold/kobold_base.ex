defmodule Hearth.KoboldBase do
  defmacro __using__(opts) do
    quote location: :keep, bind_quoted: [opts: opts] do
      use HTTPoison.Base

      url_func = Keyword.get(opts, :url_func)

      def process_request_headers(headers) do
        h = [
          {"Accept", "application/json"},
          {"Content-Type", "application/json"}
        ]

        headers ++ h
      end

      def process_url(url), do: unquote(url_func).(url)
      def process_request_body(body), do: Jason.encode!(body)
      def process_response_body(body), do: Jason.decode!(body)

      def post?(url, body) do
        case post(url, body) do
          {:ok, %HTTPoison.Response{status_code: code, body: body}} when code in 200..299 ->
            {:ok, body}

          {:ok, %HTTPoison.Response{body: body}} ->
            IO.inspect(body)
            error = body |> Map.get("error", body |> Map.get("errors", ""))
            {:error, error}

          {:error, %HTTPoison.Error{reason: reason}} ->
            IO.inspect("reason #{reason}")
            {:error, reason}
        end
      end
    end
  end
end
