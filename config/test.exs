import Config

config :opentelemetry_ecto,
  ecto_repos: [OpentelemetryEcto.TestRepo]

config :opentelemetry_ecto, OpentelemetryEcto.TestRepo,
  hostname: "localhost",
  username: "otel_ecto",
  database: "opentelemetry_ecto_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :opentelemetry,
  sampler: {:always_on, %{}},
  tracer: :ot_tracer_default,
  processors: [{:ot_batch_processor, %{scheduled_delay_ms: 1}}]
