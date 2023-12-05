# TeslaExtra

Additional Tesla middleware (plugs) that may be useful in various projects:

- `TeslaExtra.EncodeURI` - ensures that the URI is properly encoded.
- `TeslaExtra.Extend` - a plug for extending another client.
- `TeslaExtra.OptionalPlug` - a plug that wraps another plug, allowed it to be de/activated dynamically.
- `TeslaExtra.RateLimit` - rate limit middleware for Tesla using Hammer.
- `TeslaExtra.RetryAfter` - obeys the Retry-After header returned by the server when the rate limit is exceeded.
- `TeslaExtra.RuntimeOpts` - a plug that wraps another plug, allowing it to be configured with options which are evaluated on each call.
- `TeslaExtra.WithRequestId` - adds a randomly generated request ID to the headers and request options.

## Installation

This package can be installed by adding `tesla_extra` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tesla_extra, "~> 0.2"}
  ]
end
```

The docs can be found at <https://hexdocs.pm/tesla_extra>.
