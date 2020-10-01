require_relative 'near_earth_objects'

NearEarthObjects.message("intro")
date = gets.chomp
asteroid_details = NearEarthObjects.new(date)
formatted_asteroid_info = asteroid_details.format_data
formated_date = DateTime.parse(date).strftime("%A %b %d, %Y")

# Secondary Refactor Attempt
# Would like to take lines 12-30 and lines 33-36 and rewrite as an external formatting class to reduce number of lines in start.rb

column_labels = { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
column_data = column_labels.each_with_object({}) do |(col, label), hash|
  hash[col] = {
              label: label,
              width: [formatted_asteroid_info.map { |asteroid| asteroid[col].size }.max, label.size].max
              }
end

header = "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
divider = "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"

def format_row_data(row_data, column_info)
  row = row_data.keys.map { |key| row_data[key].ljust(column_info[key][:width]) }.join(' | ')
  puts "| #{row} |"
end

def create_rows(asteroid_data, column_info)
  asteroid_data.each { |asteroid| format_row_data(asteroid, column_info) }
end

NearEarthObjects.message("outro", formated_date, asteroid_details.neo_count, asteroid_details.largest_asteroid)
puts divider
puts header
create_rows(formatted_asteroid_info, column_data)
puts divider
