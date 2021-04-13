defmodule OpentelemetryEcto.MixProject do
  use Mix.Project

  def project do
    [
      app: :opentelemetry_ecto,
      description: description(),
      version: "1.0.0-rc.1",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      source_url: "https://github.com/opentelemetry-beam/opentelemetry_ecto"
    ]
  end

  defp description do
    "Trace Ecto queries with OpenTelemetry."
  end

  defp package do
    [
      licenses: ["Apache-2"],
      links: %{"GitHub" => "https://github.com/opentelemetry-beam/opentelemetry_ecto"}
    ]
  end

  def application do
    []
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases() do
    [test: ["ecto.drop -q", "ecto.create -q", "ecto.migrate --quiet", "test"]]
  end

  defp deps do
    [
      {:telemetry, "~> 0.4.2"},
      {:opentelemetry_api, "~> 1.0.0-rc", allow_pre: true},
      {:opentelemetry, "~> 1.0.0-rc", allow_pre: true},
      {:ex_doc, "~> 0.21.0", only: [:dev], runtime: false},
      {:ecto_sql, ">= 3.0.0", only: [:test]},
      {:postgrex, ">= 0.15.0", only: [:test]}
    ]
  end
end
