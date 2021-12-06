class Timelog < ApplicationRecord
  belongs_to :user

  validate :clock_in_validations
  validate :clock_out_validations

  def clock_in_validations
    if time? clock_in
      if clock_in > Time.now
        errors.add(:clock_in, "can't be in the future")
      end
    else
      errors.add(:clock_in, "must be a valid timestamp")
    end
  end

  def clock_out_validations
    if clock_out.present?
      if time? clock_out
        if clock_out > Time.now
          errors.add(:clock_out, "can't be in the future")
        end
        if clock_in.present? && clock_out < clock_in
          errors.add(:clock_out, "can't be before clock in")
        end
      else
        errors.add(:clock_out, "must be a valid timestamp")
      end
    end
  end

  def time?(val)
    val.is_a? Time
  end

  def self.ongoing_or_new(user)
    ongoing = find_by(clock_out: nil, user: user)
    ongoing.present? ? ongoing : new
  end
end
