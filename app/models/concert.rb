class Concert < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true

end
