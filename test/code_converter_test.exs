defmodule CountryCodeConverterTest do
  use ExUnit.Case
  doctest CountryCodeConverter

  test "it provide correct result for countries" do
    assert {:ok, %{iso2: "BR", iso3: "BRA"}} = CountryCodeConverter.convert(:ioc, "BRA")
    assert {:ok, %{ioc: "BRA", iso3: "BRA"}} = CountryCodeConverter.convert(:iso2, "BR")
    assert {:ok, %{ioc: "BRA", iso2: "BR"}} = CountryCodeConverter.convert(:iso3, "BRA")
    assert {:error, _} = CountryCodeConverter.convert(:bad_format, "BRA")

    assert {:error, _} = CountryCodeConverter.convert(:ioc, "unknown country")
    assert {:error, _} = CountryCodeConverter.convert(:iso2, "unknown country")
    assert {:error, _} = CountryCodeConverter.convert(:iso3, "unknown country")

    assert {:ok, iso2_countries} = CountryCodeConverter.countries(:iso2)
    assert Enum.member?(iso2_countries, "BR")

    assert {:ok, iso3_countries} = CountryCodeConverter.countries(:iso3)
    assert Enum.member?(iso3_countries, "BRA")

    assert {:ok, ioc_countries} = CountryCodeConverter.countries(:ioc)
    assert Enum.member?(ioc_countries, "BRA")
  end
end
