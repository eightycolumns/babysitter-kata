class NightlyCharge
  def initialize(babysitter, shift)
    @babysitter = babysitter
    @shift = shift
  end

  def calculate_in_dollars
    nightly_charge_in_dollars = 0

    nightly_charge_in_dollars += (
      @shift.hours_before_bedtime *
      @babysitter.rate_before_bedtime_in_dollars_per_hour
    )

    nightly_charge_in_dollars += (
      @shift.hours_after_bedtime *
      @babysitter.rate_after_bedtime_in_dollars_per_hour
    )

    nightly_charge_in_dollars
  end
end
