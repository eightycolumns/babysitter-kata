class NightlyCharge
  def initialize(babysitter, shift)
    @babysitter = babysitter
    @shift = shift
  end

  def calculate_in_dollars
    nightly_charge_in_dollars = 0

    nightly_charge_in_dollars += (
      @shift.hours_before_bedtime *
      @babysitter.hourly_rate_before_bedtime
    )

    nightly_charge_in_dollars += (
      @shift.hours_from_bedtime_to_midnight *
      @babysitter.hourly_rate_from_bedtime_to_midnight
    )

    nightly_charge_in_dollars += (
      @shift.hours_after_midnight *
      @babysitter.hourly_rate_after_midnight
    )

    nightly_charge_in_dollars
  end
end
