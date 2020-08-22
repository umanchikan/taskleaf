class Task < ApplicationRecord
  validates :title,  presence: true
  validates :content,  presence: true
  enum status: {
      incomplete:1,
      underway:2,
      complete:3
  }
end

