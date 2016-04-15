require './Babysitter.rb'
require './Shift.rb'

describe 'Babysitter kata' do
  before :each do
    @babysitter = Babysitter.new

    @babysitter.earliest_availability = 17
    @babysitter.latest_availability = 4

    @babysitter.hourly_rate_before_bedtime = 12
    @babysitter.hourly_rate_from_bedtime_to_midnight = 8
    @babysitter.hourly_rate_after_midnight = 16

    @shift = Shift.new

    @today = Time.now

    one_day = 3600 * 24
    @tomorrow = @today + one_day

    @shift.midnight = Time.new(
      @tomorrow.year, @tomorrow.month, @tomorrow.day, 0
    )
  end

  describe 'The babysitter\'s nightly charge' do
    it (
      'is $0 with a start time of 5:00 p.m., ' +
      'a bedtime of 5:00 p.m., ' +
      'and an end time of 5:00 p.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 17
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 17
      )

      @shift.end_time = Time.new(
        @today.year, @today.month, @today.day, 17
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 0
    end

    it (
      'is $0 with a start time of 4:00 a.m., ' +
      'a bedtime of 4:00 a.m., ' +
      'and an end time of 4:00 a.m.'
    ) do
      @shift.start_time = Time.new(
        @tomorrow.year, @tomorrow.month, @tomorrow.day, 4
      )

      @shift.bedtime = Time.new(
        @tomorrow.year, @tomorrow.month, @tomorrow.day, 4
      )

      @shift.end_time = Time.new(
        @tomorrow.year, @tomorrow.month, @tomorrow.day, 4
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 0
    end

    it (
      'is $16 with a start time of 8:00 p.m., ' +
      'a bedtime of 8:00 p.m., ' +
      'and an end time of 10:00 p.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.end_time = Time.new(
        @today.year, @today.month, @today.day, 22
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 16
    end

    it (
      'is $60 with a start time of 5:00 p.m., ' +
      'a bedtime of 8:00 p.m., ' +
      'and an end time of 11:00 p.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 17
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.end_time = Time.new(
        @today.year, @today.month, @today.day, 23
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 60
    end

    it (
      'is $40 with a start time of 6:00 p.m., ' +
      'a bedtime of 8:00 p.m., ' +
      'and an end time of 10:00 p.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 18
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.end_time = Time.new(
        @today.year, @today.month, @today.day, 22
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 40
    end

    it (
      'is $88 with a start time of 6:00 p.m., ' +
      'a bedtime of 8:00 p.m., ' +
      'and an end time of 2:00 a.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 18
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.end_time = Time.new(
        @tomorrow.year, @tomorrow.month, @tomorrow.day, 2
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 88
    end

    it (
      'is $112 with a start time of 8:00 p.m., ' +
      'a bedtime of 2:00 a.m., ' +
      'and an end time of 4:00 a.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.bedtime = Time.new(
        @tomorrow.year, @tomorrow.month, @tomorrow.day, 2
      )

      @shift.end_time = Time.new(
        @tomorrow.year, @tomorrow.month, @tomorrow.day, 4
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 112
    end

    it (
      'is $36 with a start time of 6:00 p.m., ' +
      'a bedtime of 9:00 p.m., ' +
      'and an end time of 9:00 p.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 18
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 21
      )

      @shift.end_time = Time.new(
        @today.year, @today.month, @today.day, 21
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 36
    end

    it (
      'is $36 with a start time of 6:00 p.m., ' +
      'a bedtime of 10:00 p.m., ' +
      'and an end time of 9:00 p.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 18
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 22
      )

      @shift.end_time = Time.new(
        @today.year, @today.month, @today.day, 21
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 36
    end

    it (
      'is $100 with a start time of 5:00 p.m., ' +
      'a bedtime of 8:00 p.m. ' +
      'and an end time of 2:00 a.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 17
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.end_time = Time.new(
        @tomorrow.year, @tomorrow.month, @tomorrow.day, 2
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 100
    end

    it (
      'is $64 with a start time of 8:00 p.m., ' +
      'a bedtime of 8:00 p.m., ' +
      'and an end time of 2:00 a.m.'
    ) do
      @shift.start_time = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.bedtime = Time.new(
        @today.year, @today.month, @today.day, 20
      )

      @shift.end_time = Time.new(
        @tomorrow.year, @tomorrow.month, @tomorrow.day, 2
      )

      expect(@babysitter.nightly_charge_in_dollars(@shift)).to be 64
    end
  end
end
