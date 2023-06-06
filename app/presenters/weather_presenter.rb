# description icon temperature
class WeatherPresenter
  def initialize(weather_data)
    @weather_data = weather_data
  end

  def description
    @weather_data['current']['condition']['text']
  end

  def icon
    @weather_data['current']['condition']['icon']
  end

  def good_weather?
    description == 'Sunny'
  end

  def temperature
    @weather_data['location']['temp_c']
  end

  def reading_weather?
    good_weather? && temperature >= 23.0
  end

  def show_weather_info
    if reading_weather?
      'Go read outside'
    else
      'Read at home'
    end
  end
end
# deep_stringify_keys
# deep_symbolize_keys
