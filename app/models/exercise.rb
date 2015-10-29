class Exercise < ActiveRecord::Base

  validates :name, presence: true
  validates :calories, presence: true

  belongs_to :user

  def self.search(search)
    search_Int = search.to_i
    if search == 'all'
      all
    elsif search.present? && (search_Int != 0)
      # where('name ILIKE ?' || 'calories = ?', "%#{search}%" || "%#{search_Int}")
      where('calories = ?', "#{search_Int}")
    elsif search.present? && (search_Int = 0)
      # where('name ILIKE ?' || 'calories = ?', "%#{search}%" || "%#{search_Int}")
      where('name ILIKE ?', "#{search}")
    else
      where(true)
    end
  end

end
