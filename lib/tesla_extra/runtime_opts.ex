defmodule TeslaExtra.RuntimeOpts do
  @moduledoc """
  A Tesla plug that wraps another plug, allowing it to be configured with
  options which are evaluated on each call.

  Options:
    :plug - the middleware module
    :opts -a function which returns the options for the plug
  """

  @behaviour Tesla.Middleware

  @impl Tesla.Middleware
  def call(env, next, opts) do
    opts[:plug].call(env, next, opts[:opts].())
  end
end
