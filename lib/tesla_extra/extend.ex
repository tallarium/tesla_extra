defmodule TeslaExtra.Extend do
  @moduledoc """
  A Tesla plug for extending another Tesla client.

  Usage:
    plug(Extend, ClientToExtend)
  """

  @behaviour Tesla.Middleware

  @impl Tesla.Middleware
  def call(env, next, opts)

  def call(env, next, [client: client, modify_middleware: modify_middleware]) do
    middleware =
      recursively_expand_middleware(client.__middleware__ ++ next)
      |> modify_middleware.()

    Tesla.run(env, middleware)
  end

  def call(env, next, base_client) do
    middleware = base_client.__middleware__ ++ next
    Tesla.run(env, middleware)
  end

  defp recursively_expand_middleware(middleware) do
    middleware
    |> Enum.flat_map(fn
      {__MODULE__, :call, [base_client]} ->
        recursively_expand_middleware(base_client.__middleware__)

      middleware ->
        [middleware]
    end)
  end
end
