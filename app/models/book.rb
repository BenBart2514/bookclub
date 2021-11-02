class Book < ApplicationRecord
  resourcify
  belongs_to :author
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_one_attached :cover, dependent: :purge

  validates :title, presence: { message: 'Please provide a title' }
  validates :date_published, presence: { message: 'Please set a publication date' }
  validate :past_date

  def past_date
    errors.add(:date_published, 'Date published must be in the past.') if date_published >= Date.today
  end
end
