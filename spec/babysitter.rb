require_relative '../src/babysitter.rb'

describe 'The babysitter' do
  before :each do
    @babysitter = Babysitter.new
    @babysitter.earliest_availability = 17
    @babysitter.latest_availability = 4
  end

  it 'starts no earlier than 5:00 p.m.' do
    expect(@babysitter.earliest_availability).to be 17
  end

  it 'leaves no later than 4:00 a.m.' do
    expect(@babysitter.latest_availability).to be 4
  end
end
