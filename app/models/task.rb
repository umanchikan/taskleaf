class Task < ApplicationRecord
  validates :title,  presence: true
  validates :content,  presence: true
  enum status: {
      incomplete:1,
      underway:2,
      complete:3
  }
  #scope :search_title_and_status, -> (){
  #  where("title LIKE?", "%#{params[:task][:title]}%").where(status: params[:task][:status])
  #}
  scope :search_title, -> (title) {
    where("title like?", "%#{title}%")
  }
  scope :search_status, -> (status) {
    where(status: status)
  }
end

