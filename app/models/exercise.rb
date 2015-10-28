class Exercise < ActiveRecord::Base

  validates :name, presence: true
  validates :calories, presence: true

  belongs_to :user

end
