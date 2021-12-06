require "test_helper"

class TimelogTest < ActiveSupport::TestCase
  test "clock_in is reqired" do
    t = Timelog.new user: users(:one)
    assert_not t.valid?
    assert t.errors.messages[:clock_in].present?

    t.clock_in = "a"
    assert_not t.valid?
    assert t.errors.messages[:clock_in].present?

    t.clock_in = Time.now - 1.hour
    assert t.valid?
  end

  test "clock_out is optional" do
    t = Timelog.new user: users(:one), clock_in: Time.now - 2.hours
    assert t.valid?

    t.clock_out = Time.now - 1.hour
    assert t.valid?
  end

  test "no future times" do
    t = Timelog.new user: users(:one), clock_in: Time.now + 2.hours, clock_out: Time.now + 3.hours
    assert_not t.valid?
    assert t.errors.messages[:clock_in].present?
    assert t.errors.messages[:clock_out].present?

    t.clock_in = Time.now - 2.minutes
    t.clock_out = Time.now - 1.minute
    assert t.valid?
  end

  test "clock out can't be before clock in" do
    t = Timelog.new user: users(:one), clock_in: Time.now - 2.hours, clock_out: Time.now - 3.hours
    assert_not t.valid?
    assert t.errors.messages[:clock_out].present?

    t.clock_out = Time.now - 2.minutes
    assert t.valid?
  end
end
