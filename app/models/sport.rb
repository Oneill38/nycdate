class Sport < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true
end
