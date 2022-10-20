defmodule Reto do
  @moduledoc """
    Modulo que envuelve la solución al reto de kommit
  """
  @doc """
    result función encargada de dar la solución y el conteo de los numeros 
    divisibles entre 3 de los numeros dados.

    ## Examples
    
      iex> Reto.result(3, 5)
      2

      iex> Reto.result(3, 1000)
      550

      iex> Reto.result(0, 1)
      {:error, "Los valores son muy bajos, arg1 debe ser mayor o igual a 1 y arg2 debe ser mayor o igual a 2"}

      iex> Reto.result(10, 5)
      {:error, "arg1 debe ser menor que arg2"}
  """
  def result(min \\ 1, max \\ 2)
  def result(min, max) when min > max, do: {:error, "arg1 debe ser menor que arg2"}
  def result(min, max) when min < 1 or max < 2, do: {:error, "Los valores son muy bajos, arg1 debe ser mayor o igual a 1 y arg2 debe ser mayor o igual a 2"}
  def result(min, max) do
    generar_numeros() 
    |> Stream.map(&String.to_integer/1)
    |> Enum.slice(min-1..max-1)
    |> Stream.filter(&rem_3/1)
    |> Enum.count()
  end

  defp generar_numeros(), do: Stream.iterate("1", fn x -> x <> "#{String.length(x) + 1}" end)
  defp rem_3(x), do: rem(x, 3) === 0
end
