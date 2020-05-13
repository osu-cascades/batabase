# frozen_string_literal: true

require 'byebug'
require 'csv'

data = CSV.read('../sonobat_outputs.csv')

data.each_with_index do |line, index|
  data[index][0] = line.first.to_i - 44
end

File.open('../sonobat_outputs.csv', 'w') do |file|
  data.each do |line|
    file.puts(CSV.generate_line(line))
  end
end
