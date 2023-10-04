defmodule TeslaExtra.OptionalPlug do
  @moduledoc """
  A Tesla plug that wraps another plug, allowing it to be de/activated dynamically.

  Options:
    :plug - the middleware module
    :opts - a function which returns the options for the plug
    :active? - a function which takes the request environment and decides whether
        the plug should be run.
  """

  @behaviour Tesla.Middleware

  @impl Tesla.Middleware
  def call(env, next, opts) do
    if opts[:active?].(env) do
      opts[:plug].call(env, next, opts[:opts].())
    else
      Tesla.run(env, next)
    end
  end
end
