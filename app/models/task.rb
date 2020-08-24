class Task < ApplicationRecord
  validates :title,  presence: true
  validates :content,  presence: true
  enum status: {
      incomplete: 1,
      underway: 2,
      complete: 3
  }
  enum priority: {
      low: 1,
      middle: 2,
      high: 3
  }
  scope :search_title, -> (title) {
    where("title like?", "%#{title}%")
  }
  scope :search_status, -> (status) {
    where(status: status)
  }
end

