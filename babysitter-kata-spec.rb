require './Babysitter.rb'
require './Shift.rb'

describe 'Babysitter kata' do
  before :each do
    @babysitter = Babysitter.new(17, 4, 12, 8, 16)
  end

  describe 'The babysitter\'s nightly charge' do
    it (
      'is $0 with a start time of 5:00 p.m., a bedtime ' +
      ' of 5:00 p.m., and an end time of 5:00 p.m.'
    ) do
      shift = Shift.new(17, 17, 17)
      expect(@babysitter.nightly_charge_in_dollars(shift)).to be 0
    end

    it (
      'is $60 with a start time of 5:00 p.m., a bedtime ' +
      'of 8:00 p.m., and an end time of 11:00 p.m.'
    ) do
      shift = Shift.new(17, 20, 23)
      expect(@babysitter.nightly_charge_in_dollars(shift)).to be 60
    end

    it (
      'is $40 with a start time of 6:00 p.m., a bedtime ' +
      'of 8:00 p.m., and an end time of 10:00 p.m.'
    ) do
      shift = Shift.new(18, 20, 22)
      expect(@babysitter.nightly_charge_in_dollars(shift)).to be 40
    end

    it (
      'is $88 with a start time of 6:00 p.m., a bedtime ' +
      'of 8:00 p.m., and an end time of 2:00 a.m.'
    ) do
      shift = Shift.new(18, 20, 2)
      expect(@babysitter.nightly_charge_in_dollars(shift)).to be 88
    end

    it (
      'is $112 with a start time of 8:00 p.m., a bedtime ' +
      'of 2:00 a.m., and an end time of 4:00 a.m.'
    ) do
      shift = Shift.new(20, 2, 4)
      expect(@babysitter.nightly_charge_in_dollars(shift)).to be 112
    end
  end
end
