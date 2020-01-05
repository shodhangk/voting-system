class User < ApplicationRecord
  has_secure_password :validations => false
  include ActiveStorageUrlHelper
  validates :phone, presence: true,
                    numericality: true,
                    length: { minimum: 10, maximum: 15 }
  validates :phone, presence: true
  validates :gender, presence: true, inclusion: { in: %w(Male Female Other) }
  validates_uniqueness_of [:adhar_number, :phone, :voter_id],
                          message: 'must be unique'
  validate :age_atleast_should_be_18
  has_one_attached :profile

  has_many :votes
  has_many :elections, through: :votes

  before_create :generate_verification_token

  def profile_url
    attachment_url(profile) 
  end

  def age_atleast_should_be_18
    return if age.blank?
    errors.add(:age, 'must be 18 years or older') if age < 18
  end

  def generate_verification_token
    self.verification_id = SecureRandom.uuid
    #Todo
    #Send SMS to user which include passcode.
    #Passcode used while  user SignUp
  end

end
