defmodule TeslaExtra.RetryAfter do
  @moduledoc """
  Obeys the Retry-After header returned by the server when the rate limit is exceeded.
  """

  @behaviour Tesla.Middleware

  @impl Tesla.Middleware
  def call(env, next, _opts) do
    env
    |> Tesla.run(next)
    |> handle_rate_limit_headers(env, next)
  end

  defp handle_rate_limit_headers(env, next, %{status_code: 429, headers: headers}) do
    case Enum.find_value(headers, fn {k, _} -> k == "retry-after" end) do
      nil ->
        env

      retry_after ->
        retry_after = String.to_integer(retry_after)
        :timer.sleep(retry_after * 1000)
        Tesla.run(env, next)
    end
  end

  defp handle_rate_limit_headers(env, _next, _response) do
    env
  end
end
