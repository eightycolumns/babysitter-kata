class Shift
  def initialize(start_time, bedtime, end_time)
    @midnight = 24

    @start_time = start_time
    @bedtime = bedtime
    @end_time = end_time
  end

  attr_reader :midnight

  attr_reader :start_time
  attr_reader :bedtime
  attr_reader :end_time
end
