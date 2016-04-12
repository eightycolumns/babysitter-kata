class NightlyCharge
  def initialize(babysitter, shift)
    @babysitter = babysitter
    @shift = shift
  end

  def calculate_in_dollars
    nightly_charge_in_dollars = 0

    hours_before_bedtime = @shift.bedtime - @shift.start_time

    if (shift_ended_after_midnight)
      hours_after_bedtime = Shift::MIDNIGHT - @shift.bedtime
    else
      hours_after_bedtime = @shift.end_time - @shift.bedtime
    end

    if (shift_ended_after_midnight)
      hours_after_midnight = @shift.end_time
    else
      hours_after_midnight = 0
    end

    rate_before_bedtime = @babysitter.rate_before_bedtime_in_dollars_per_hour
    rate_after_bedtime = @babysitter.rate_after_bedtime_in_dollars_per_hour
    rate_after_midnight = @babysitter.rate_after_midnight_in_dollars_per_hour

    nightly_charge_in_dollars += (hours_before_bedtime * rate_before_bedtime)
    nightly_charge_in_dollars += (hours_after_bedtime * rate_after_bedtime)
    nightly_charge_in_dollars += (hours_after_midnight * rate_after_midnight)

    nightly_charge_in_dollars
  end

  private

  def shift_ended_after_midnight
    @shift.end_time <= @shift.start_time
  end
end
