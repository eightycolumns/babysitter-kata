class Shift
  def initialize(start_time, bedtime, end_time)
    @midnight = 24

    @start_time = start_time
    @bedtime = bedtime
    @end_time = end_time
  end

  attr_accessor :start_time
  attr_accessor :bedtime
  attr_accessor :end_time

  def hours_before_bedtime
    if bedtime_is_after_midnight
      @midnight - @start_time
    else
      @bedtime - @start_time
    end
  end

  def hours_from_bedtime_to_midnight
    if end_time_is_after_midnight
      if bedtime_is_after_midnight
        0
      else
        @midnight - @bedtime
      end
    else
      @end_time - @bedtime
    end
  end

  def hours_after_midnight
    if end_time_is_after_midnight
      @end_time
    else
      0
    end
  end

  private

  def end_time_is_after_midnight
    @end_time < @start_time
  end

  def bedtime_is_after_midnight
    @bedtime < @start_time
  end
end
