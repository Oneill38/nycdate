class Search < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :start_time, presence: true
end
