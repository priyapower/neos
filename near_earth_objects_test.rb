require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def setup
    @neos_from_dynamic_date = NearEarthObjects.new('2020-09-29')
    @neos_from_dynamic_date_vs_2 = NearEarthObjects.new('2020-01-01')
  end

  def test_it_exists
    assert_instance_of NearEarthObjects, @neos_from_dynamic_date
    assert_instance_of NearEarthObjects, @neos_from_dynamic_date_vs_2
  end

  def test_a_date_returns_a_list_of_neos
    assert_equal '(2020 SN2)', @neos_from_dynamic_date.neo_data[0][:name]
  end

  def test_it_can_return_largest_asteroid_with_max_integer_value
    assert_equal 1949, @neos_from_dynamic_date.largest_asteroid
  end

  def test_it_can_return_count_neos_from_date_given
    assert_equal 12, @neos_from_dynamic_date.neo_count
    assert_equal 13, @neos_from_dynamic_date_vs_2.neo_count
  end

  def test_it_can_format_data_for_print
    assert_equal "253 ft", @neos_from_dynamic_date.format_data[0][:diameter]
  end
end
