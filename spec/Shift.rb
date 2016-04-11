require_relative '../src/Shift.rb'

describe 'A shift' do
  before :each do
    @shift = Shift.new
  end

  it 'has a start time' do
    @shift.start_time = 17
    expect(@shift.start_time).to be 17
  end

  it 'has a bedtime' do
    @shift.bedtime = 20
    expect(@shift.bedtime).to be 20
  end

  it 'has an end time' do
    @shift.end_time = 23
    expect(@shift.end_time).to be 23
  end
end
