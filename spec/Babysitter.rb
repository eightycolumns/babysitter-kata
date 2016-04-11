require_relative '../src/Babysitter.rb'

describe 'The babysitter' do
  before :each do
    @babysitter = Babysitter.new
  end

  it 'starts no earlier than 5:00 p.m.' do
    @babysitter.earliest_availability = 17
    expect(@babysitter.earliest_availability).to be 17
  end

  it 'leaves no later than 4:00 a.m.' do
    @babysitter.latest_availability = 4
    expect(@babysitter.latest_availability).to be 4
  end

  it 'makes $12 per hour before bedtime' do
    @babysitter.rate_before_bedtime_in_dollars_per_hour = 12
    expect(@babysitter.rate_before_bedtime_in_dollars_per_hour).to be 12
  end

  it 'makes $8 per hour after bedtime' do
    @babysitter.rate_after_bedtime_in_dollars_per_hour = 8
    expect(@babysitter.rate_after_bedtime_in_dollars_per_hour).to be 8
  end

  it 'makes $16 per hour after midnight' do
    @babysitter.rate_after_midnight_in_dollars_per_hour = 16
    expect(@babysitter.rate_after_midnight_in_dollars_per_hour).to be 16
  end
end
