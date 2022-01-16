# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable  Style/Documentation
class Clock
  attr_accessor :total

  def initialize(hours, minutes)
    @total = convert_to_min(hours) + minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def convert_to_min(hours)
    hours == 0 ? 24 * 60 : hours * 60
  end

  def convert_to(hour)
    hour -= 24 while hour > 24
    hour += 24 while hour < 0

    hour = 0 if hour == 24
    hour
  end

  def +(min)
    self.total += min
    self
  end

  def -(min)
    self.total -= min
    self
  end

  def ==(obj)
    total == obj.total
  end

  def to_s
    hr, min = total.divmod(60)
    hr = convert_to(hr) if hr >= 24 || hr < 0
    hour = hr > 9 ? "#{hr}" : "0#{hr}"
    minute = min > 9 ? "#{min}" : "0#{min}"
    "#{hour}:#{minute}"
  end
end
# rubocop:enable Style/FrozenStringLiteralComment
# rubocop:enable  Style/Documentation
