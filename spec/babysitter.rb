require_relative '../src/babysitter.rb'

describe 'The babysitter' do
  before :each do
    @babysitter = Babysitter.new
    @babysitter.earliest_availability = 17
    @babysitter.latest_availability = 4
    @babysitter.rate_before_bedtime_in_dollars_per_hour = 12
    @babysitter.rate_after_bedtime_in_dollars_per_hour = 8
    @babysitter.rate_after_midnight_in_dollars_per_hour = 16
  end

  it 'starts no earlier than 5:00 p.m.' do
    expect(@babysitter.earliest_availability).to be 17
  end

  it 'leaves no later than 4:00 a.m.' do
    expect(@babysitter.latest_availability).to be 4
  end

  it 'makes $12 per hour before bedtime' do
    expect(@babysitter.rate_before_bedtime_in_dollars_per_hour).to be 12
  end

  it 'makes $8 per hour after bedtime' do
    expect(@babysitter.rate_after_bedtime_in_dollars_per_hour).to be 8
  end

  it 'makes $16 per hour after midnight' do
    expect(@babysitter.rate_after_midnight_in_dollars_per_hour).to be 16
  end
end
