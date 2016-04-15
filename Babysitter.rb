class Babysitter
  attr_accessor(
    :earliest_availability,
    :latest_availability,

    :hourly_rate_before_bedtime,
    :hourly_rate_from_bedtime_to_midnight,
    :hourly_rate_after_midnight
  )

  def nightly_charge_in_dollars(shift)
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

      one_hour = 3600
      time += one_hour
    end

    nightly_charge_in_dollars
  end
end
