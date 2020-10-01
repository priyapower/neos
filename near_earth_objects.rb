require 'faraday'
require 'figaro'
require 'pry'
require 'json'
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects

  def initialize(date)
    @date = date
    @conn = Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
  end

  def neo_data
    conn_data = @conn.get('/neo/rest/v1/feed')
    JSON.parse(conn_data.body, symbolize_names: true)[:near_earth_objects][:"#{@date}"]
  end

  def largest_asteroid
    neo_data.map do |asteroid|
      asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i
    end.max
  end

  def neo_count
    neo_data.count
  end

  def format_data
    neo_data.map do |asteroid|
      {
        name: asteroid[:name],
        diameter: "#{asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
        miss_distance: "#{asteroid[:close_approach_data][0][:miss_distance][:miles].to_i} miles"
      }
    end
  end

  def self.message(type, *optional)
    case type
    when "intro"
      puts "___________________________________________________________________________________________________\nWelcome to NEO. Here you will find information about how many meteors, asteroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day.\nPlease enter a date in the following format YYYY-MM-DD."
      print ">>"
    when "outro"
      puts "___________________________________________________________________________________________________\nOn #{optional[0]}, there were #{optional[1]} objects that almost collided with the earth.\nThe largest of these was #{optional[2]} ft. in diameter.\n\nHere is a list of objects with details:"
    end
  end
end
