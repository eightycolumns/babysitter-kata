require_relative '../src/babysitter.rb'

describe 'The babysitter' do
  before :each do
    @babysitter = Babysitter.new
    @babysitter.earliest_availability = 17
  end

  it 'starts no earlier than 5:00 p.m.' do
    expect(@babysitter.earliest_availability).to be 17
  end
end
