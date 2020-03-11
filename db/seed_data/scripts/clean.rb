# frozen_string_literal: true

unit_to_index = {}
sample_units = IO.readlines('sample_units.csv', chomp: true)
detector_locations = IO.readlines('detector_locations.csv', chomp: true)

sample_units.each_with_index do |line, index|
  unit_to_index[line.split(',').first] = index + 1
end

detector_locations.each_with_index do |line, index|
  current_line = line.split(',')
  current_line[0] = unit_to_index[current_line.first]
  detector_locations[index] = current_line
end

File.open('detector_locations.csv', 'w') do |file|
  detector_locations.each do |line|
    file.puts(line.join(','))
  end
end
