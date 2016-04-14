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

    nightly_charge_in_dollars += (
      shift.hours_before_bedtime *
      @hourly_rate_before_bedtime
    )

    nightly_charge_in_dollars += (
      shift.hours_from_bedtime_to_midnight *
      @hourly_rate_from_bedtime_to_midnight
    )

    nightly_charge_in_dollars += (
      shift.hours_after_midnight *
      @hourly_rate_after_midnight
    )

    nightly_charge_in_dollars
  end
end
