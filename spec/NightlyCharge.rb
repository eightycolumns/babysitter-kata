require_relative '../src/Babysitter.rb'
require_relative '../src/Shift.rb'
require_relative '../src/NightlyCharge.rb'

describe 'The babysitter\'s nightly charge' do
  before :all do
    @babysitter = Babysitter.new
    @babysitter.earliest_availability = 17
    @babysitter.latest_availability = 4
    @babysitter.rate_before_bedtime_in_dollars_per_hour = 12
    @babysitter.rate_after_bedtime_in_dollars_per_hour = 8
    @babysitter.rate_after_midnight_in_dollars_per_hour = 16
  end

  before :each do
    @shift = Shift.new
  end

  it 'is $60 with a start time of 5:00 p.m., a bedtime of 8:00 p.m., and an end time of 11:00 p.m.' do
    @shift.start_time = 17
    @shift.bedtime = 20
    @shift.end_time = 23

    nightly_charge = NightlyCharge.new(@babysitter, @shift)

    expect(nightly_charge.calculate_in_dollars).to be 60
  end

  it 'is $40 with a start time of 6:00 p.m., a bedtime of 8:00 p.m., and an end time of 10:00 p.m.' do
    @shift.start_time = 18
    @shift.bedtime = 20
    @shift.end_time = 22

    nightly_charge = NightlyCharge.new(@babysitter, @shift)

    expect(nightly_charge.calculate_in_dollars).to be 40
  end
end
