# Enum.map([2, 3, 4], fn x -> x * 10 end)

defmodule Final do
	def countdown(1) do
		IO.puts "#{1}"
	end

	def countdown(x) when x > 1 do
		IO.puts "#{x}"
		countdown(x - 1)
	end
end