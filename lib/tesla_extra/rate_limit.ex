if Code.ensure_loaded?(Hammer) do
  defmodule TeslaExtra.RateLimit do
    @moduledoc """
    Rate limit middleware for Tesla using Hammer
    """

    @behaviour Tesla.Middleware

    @impl Tesla.Middleware
    def call(env, next, opts) do
      %{host: host} = URI.parse(env.url)

      case Hammer.check_rate(
             "rate_limit:#{host}",
             Keyword.fetch!(opts, :scale_ms),
             Keyword.fetch!(opts, :limit)
           ) do
        {:allow, _} ->
          Tesla.run(env, next)

        {:deny, _} ->
          {:error, :rate_limit}
      end
    end
  end
end
