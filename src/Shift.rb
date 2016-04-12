class Shift
  attr_accessor :start_time
  attr_accessor :bedtime
  attr_accessor :end_time

  def hours_before_bedtime
    @bedtime - @start_time
  end

  def hours_after_bedtime
    @end_time - @bedtime
  end
end
