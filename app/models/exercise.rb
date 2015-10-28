class Exercise < ActiveRecord::Base

  validates :name, presence: true
  validates :calories, presence: true

  belongs_to :user

  def self.search(search)
  if search == 'all'
      all
  elsif search.present?
    where('name ILIKE ?', "%#{search}%")
  else
    where(true)
  end
end

end
