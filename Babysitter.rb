class Babysitter
  attr_accessor(
    :earliest_availability,
    :latest_availability,

    :hourly_rate_before_bedtime,
    :hourly_rate_from_bedtime_to_midnight,
    :hourly_rate_after_midnight
  )

  def nightly_charge_in_dollars(shift)
    if shift_starts_before_earliest_availability(shift)
      raise(ArgumentError, 'shift starts before earliest availability')
    elsif shift_ends_after_latest_availability(shift)
      raise(ArgumentError, 'shift ends after latest availability')
    end

    nightly_charge_in_dollars = 0

    time = shift.start_time

    while time < shift.end_time
      if time >= shift.midnight
        nightly_charge_in_dollars += @hourly_rate_after_midnight
      elsif time >= shift.bedtime
        nightly_charge_in_dollars += @hourly_rate_from_bedtime_to_midnight
      else
        nightly_charge_in_dollars += @hourly_rate_before_bedtime
      end

      seconds_per_minute = 60
      minutes_per_hour = 60

      one_hour = seconds_per_minute * minutes_per_hour

      time += one_hour
    end

    nightly_charge_in_dollars
  end

  private

  def shift_starts_before_earliest_availability(shift)
    start_time = (shift.start_time.hour == 0) ? 24 : shift.start_time.hour
    start_time < @earliest_availability && start_time > @latest_availability
  end

  def shift_ends_after_latest_availability(shift)
    end_time = (shift.end_time.hour == 0) ? 24 : shift.end_time.hour
    end_time > @latest_availability && end_time < @earliest_availability
  end
end
