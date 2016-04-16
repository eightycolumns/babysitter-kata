require './Babysitter.rb'
require './Shift.rb'

describe 'Babysitter kata' do
  before :each do
    @babysitter = Babysitter.new(17, 4, 12, 8, 16)

    @today = Time.now

    seconds_per_minute = 60
    minutes_per_hour = 60
    hours_per_day = 24

    one_day = seconds_per_minute * minutes_per_hour * hours_per_day

    @tomorrow = @today + one_day
  end

  describe 'Babysitter.charge_in_dollars' do
    it (
      'raises an ArgumentError when a shift starts ' +
      'before the babysitter\'s earliest availability'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 16),
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 4)
      )

      expect do
        @babysitter.charge_in_dollars(shift)
      end.to raise_error ArgumentError
    end

    it (
      'raises an ArgumentError when a shift ends ' +
      'after the babysitter\'s latest availability'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 17),
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 5)
      )

      expect do
        @babysitter.charge_in_dollars(shift)
      end.to raise_error ArgumentError
    end
  end

  describe 'The babysitter\'s nightly charge' do
    it (
      'is $0 with a start time of 5:00 p.m., a bedtime of 5:00 p.m., ' +
      'and an end time of 5:00 p.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 17),
        Time.new(@today.year, @today.month, @today.day, 17),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@today.year, @today.month, @today.day, 17)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 0
    end

    it (
      'is $40 with a start time of 6:00 p.m., a bedtime of 8:00 p.m., ' +
      'and an end time of 10:00 p.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 18),
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@today.year, @today.month, @today.day, 22)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 40
    end

    it (
      'is $56 with a start time of 6:00 p.m., a bedtime of 8:00 p.m., ' +
      'and an end time of 12:00 a.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 18),
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 56
    end

    it (
      'is $88 with a start time of 6:00 p.m., a bedtime of 8:00 p.m., ' +
      'and an end time of 2:00 a.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 18),
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 2)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 88
    end

    it (
      'is $24 with a start time of 6:00 p.m., a bedtime of 8:00 p.m., ' +
      'and an end time of 8:00 p.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 18),
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@today.year, @today.month, @today.day, 20)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 24
    end

    it (
      'is $16 with a start time of 8:00 p.m., a bedtime of 8:00 p.m., ' +
      'and an end time of 10:00 p.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@today.year, @today.month, @today.day, 22)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 16
    end

    it (
      'is $144 with a start time of 5:00 p.m., a bedtime of 11:00 p.m., ' +
      'and an end time of 4:00 a.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 17),
        Time.new(@today.year, @today.month, @today.day, 23),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 4)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 144
    end

    it (
      'is $148 with a start time of 5:00 p.m., a bedtime of 1:00 a.m., ' +
      'and an end time of 4:00 a.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 17),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 1),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 4)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 148
    end

    it (
      'is $96 with a start time of 8:00 p.m., a bedtime of 8:00 p.m., ' +
      'and an end time of 4:00 a.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@today.year, @today.month, @today.day, 20),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 4)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 96
    end

    it (
      'is $64 with a start time of 12:00 a.m., a bedtime of 12:00 a.m., ' +
      'and an end time of 4:00 a.m.'
    ) do
      shift = Shift.new(
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 4)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 64
    end

    it (
      'is $36 with a start time of 6:00 p.m., a bedtime of 10:00 p.m., ' +
      'and an end time of 9:00 p.m.'
    ) do
      shift = Shift.new(
        Time.new(@today.year, @today.month, @today.day, 18),
        Time.new(@today.year, @today.month, @today.day, 22),
        Time.new(@tomorrow.year, @tomorrow.month, @tomorrow.day, 0),
        Time.new(@today.year, @today.month, @today.day, 21)
      )

      expect(@babysitter.charge_in_dollars(shift)).to be 36
    end
  end
end
