require './Babysitter.rb'
require './Shift.rb'

describe 'The babysitter' do
  before :each do
    @babysitter = Babysitter.new

    @babysitter.earliest_availability = 17
    @babysitter.latest_availability = 4
    @babysitter.hourly_rate_before_bedtime = 12
    @babysitter.hourly_rate_from_bedtime_to_midnight = 8
    @babysitter.hourly_rate_after_midnight = 16
  end

  it 'starts no earlier than 5:00 p.m.' do
    expect(@babysitter.earliest_availability).to be 17
  end

  it 'leaves no later than 4:00 a.m.' do
    expect(@babysitter.latest_availability).to be 4
  end

  it 'makes $12 per hour before bedtime' do
    expect(@babysitter.hourly_rate_before_bedtime).to be 12
  end

  it 'makes $8 per hour after bedtime' do
    expect(@babysitter.hourly_rate_from_bedtime_to_midnight).to be 8
  end

  it 'makes $16 per hour after midnight' do
    expect(@babysitter.hourly_rate_after_midnight).to be 16
  end
end

describe 'A shift' do
  before :each do
    @shift = Shift.new

    @shift.start_time = 17
    @shift.bedtime = 20
    @shift.end_time = 23
  end

  it 'has a start time' do
    expect(@shift.start_time).to be 17
  end

  it 'has a bedtime' do
    expect(@shift.bedtime).to be 20
  end

  it 'has an end time' do
    expect(@shift.end_time).to be 23
  end
end

describe 'The babysitter\'s nightly charge' do
  before :each do
    @babysitter = Babysitter.new

    @babysitter.earliest_availability = 17
    @babysitter.latest_availability = 4
    @babysitter.hourly_rate_before_bedtime = 12
    @babysitter.hourly_rate_from_bedtime_to_midnight = 8
    @babysitter.hourly_rate_after_midnight = 16
  end

  it (
    'is $60 with a start time of 5:00 p.m., a bedtime ' +
    'of 8:00 p.m., and an end time of 11:00 p.m.'
  ) do
    shift = Shift.new

    shift.start_time = 17
    shift.bedtime = 20
    shift.end_time = 23

    expect(@babysitter.nightly_charge_in_dollars(shift)).to be 60
  end

  it (
    'is $40 with a start time of 6:00 p.m., a bedtime ' +
    'of 8:00 p.m., and an end time of 10:00 p.m.'
  ) do
    shift = Shift.new

    shift.start_time = 18
    shift.bedtime = 20
    shift.end_time = 22

    expect(@babysitter.nightly_charge_in_dollars(shift)).to be 40
  end

  it (
    'is $88 with a start time of 6:00 p.m., a bedtime ' +
    'of 8:00 p.m., and an end time of 2:00 a.m.'
  ) do
    shift = Shift.new

    shift.start_time = 18
    shift.bedtime = 20
    shift.end_time = 2

    expect(@babysitter.nightly_charge_in_dollars(shift)).to be 88
  end

  it (
    'is $112 with a start time of 8:00 p.m., a bedtime ' +
    'of 2:00 a.m., and an end time of 4:00 a.m.'
  ) do
    shift = Shift.new

    shift.start_time = 20
    shift.bedtime = 2
    shift.end_time = 4

    expect(@babysitter.nightly_charge_in_dollars(shift)).to be 112
  end
end
