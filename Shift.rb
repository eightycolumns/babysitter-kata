class Shift
  def initialize(start_time, bedtime, midnight, end_time)
    @start_time = start_time
    @bedtime = bedtime
    @midnight = midnight
    @end_time = end_time
  end

  attr_reader(:start_time, :bedtime, :midnight, :end_time)
end
