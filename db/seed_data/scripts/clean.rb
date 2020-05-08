# frozen_string_literal: true

require 'byebug'
require 'csv'

data = CSV.read('../species_species_groups.csv')

data.each_with_index do |line, index|
  next if index.zero?

  data[index] = [line.last.to_i - 19, line.first.to_i - 302]
end

File.open('../species_species_groups.csv', 'w') do |file|
  data.each do |line|
    file.puts(CSV.generate_line(line))
  end
end
