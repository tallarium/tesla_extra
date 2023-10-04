defmodule TeslaExtra.WithRequestId do
  @moduledoc """
  Adds a randomly generated request ID to the headers and request options.
  """

  @behaviour Tesla.Middleware

  @impl Tesla.Middleware
  def call(env, next, _opts) do
    request_id = UUID.uuid4()
    id_header = {"X-Request-ID", request_id}

    env =
      env
      |> Map.update!(:opts, &Keyword.put(&1, :request_id, request_id))
      |> Map.update!(:headers, &[id_header | &1])

    Tesla.run(env, next)
  end
end
