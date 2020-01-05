class Election < ApplicationRecord
  has_many :candidates
  has_many :votes

  validates_presence_of [:name, :start_time, :end_time], message: "can't be blank"

  validate :end_date_is_after_start_date

  IN_ACTIVE = "in_active".freeze
  ACTIVE = 'active'.freeze
  FINISHED = 'finished'.freeze

  def end_date_is_after_start_date
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, 'cannot be before the start date')
    end
  end

  def active?
    status == ACTIVE
  end

  def status
    if Time.now < start_time
      return IN_ACTIVE
    elsif Time.now > end_time
      return FINISHED
    else
      return ACTIVE
    end
  end
end
