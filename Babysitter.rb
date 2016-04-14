class Babysitter
  def initialize(
    earliest_availability,
    latest_availability,
    hourly_rate_before_bedtime,
    hourly_rate_from_bedtime_to_midnight,
    hourly_rate_after_midnight
  )
    @earliest_availability = earliest_availability
    @latest_availability = latest_availability
    @hourly_rate_before_bedtime = hourly_rate_before_bedtime
    @hourly_rate_from_bedtime_to_midnight = hourly_rate_from_bedtime_to_midnight
    @hourly_rate_after_midnight = hourly_rate_after_midnight
  end

  def nightly_charge_in_dollars(shift)
    nightly_charge_in_dollars = 0

    for hour in shift.start_time...shift.end_time
      if hour >= shift.midnight
        nightly_charge_in_dollars += @hourly_rate_after_midnight
      elsif hour >= shift.bedtime
        nightly_charge_in_dollars += @hourly_rate_from_bedtime_to_midnight
      else
        nightly_charge_in_dollars += @hourly_rate_before_bedtime
      end
    end

    nightly_charge_in_dollars
  end
end
