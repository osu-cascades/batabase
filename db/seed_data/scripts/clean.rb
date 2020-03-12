# frozen_string_literal: true

require 'csv'

deployments = CSV.read('../deployments.csv')

deployments.each_with_index do |line, index|
  line_split_on_comma = line[12].split(',')
  reduced_data = line_split_on_comma[4..12]

  line.pop

  reduced_data.each do |current|
    line << current.split(':')[1].slice(1..-1)
  end

  deployments[index] = line
end

File.open('../deployments.csv', 'w') do |file|
  deployments.each do |line|
    file.puts(CSV.generate_line(line))
  end
end
