defmodule CountryCodeConverter.MixProject do
  use Mix.Project

  def project do
    [
      app: :country_code_converter,
      version: "1.0.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: description(),
      deps: deps(),
      source_url: "https://github.com/m1ome/country_code_converter"
    ]
  end

  defp deps() do
    [
      {:ex_doc, "~> 0.30.6", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Package for a ISO country code conversion between: ISO2, ISO3 and IOC with zero dependencies"
  end

  defp package() do
    [
      name: "country_code_converter",
      files: ~w(lib .formatter.exs mix.exs README.* LICENSE),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/m1ome/country_code_converter"}
    ]
  end
end
