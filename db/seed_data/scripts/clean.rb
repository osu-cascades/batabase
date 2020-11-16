# frozen_string_literal: true

require 'byebug'
require 'csv'

data = CSV.read('../sonobat_outputs.csv')

data.each_with_index do |_line, index|
  data[index][0] = data[index][2]
end

File.open('../sonobat_outputs.csv', 'w') do |file|
  data.each do |line|
    file.puts(CSV.generate_line(line))
  end
end
