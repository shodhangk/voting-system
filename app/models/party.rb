class Party < ApplicationRecord
  include ActiveStorageUrlHelper
  has_one_attached :logo
  has_many :candidates
  validates :name, presence: true, length: { maximum: 12, minimum: 3 }
  validates_uniqueness_of :name, message: 'must be unique'

  def logo_url
    attachment_url(logo)
  end
end
