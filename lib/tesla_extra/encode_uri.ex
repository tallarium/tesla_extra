defmodule TeslaExtra.EncodeURI do
  @moduledoc """
  Ensures that the URI is properly encoded.
  """

  @behaviour Tesla.Middleware

  @impl Tesla.Middleware
  def call(env, next, _opts) do
    Tesla.run(Map.update!(env, :url, &URI.encode/1), next)
  end
end
