defmodule TeslaExtra.MixProject do
  use Mix.Project

  def project do
    [
      app: :tesla_extra,
      version: "0.1.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      description: "Additional Tesla middleware",
      package: package(),
      deps: deps(),
      name: "TeslaExtra",
      source_url: "https://github.com/tallarium/tesla_extra"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:hammer, "~> 6.1", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:tesla, "~> 1.5"},
      {:uniq, "~> 0.1"}
    ]
  end

  def package do
    [
      name: "tesla_extra",
      maintainers: ["Tallarium Developers"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/tallarium/tesla_extra"}
    ]
  end
end
