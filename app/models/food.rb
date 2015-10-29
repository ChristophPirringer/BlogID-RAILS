class Food < ActiveRecord::Base

  validates :name, presence: true
  validates :calories, presence: true

  belongs_to :user

  # def self.search(search)
  #   search_Int = search.to_i
  #   # binding.pry
  #   if search == 'all'
  #     all
  #   elsif search.present?
  #     where('name ILIKE ?' || 'calories LIKE ?', "%#{search}%" || "%#{search_Int}")
  #     # where('name || calories ILIKE ?', "%#{search}%" || "%#{search_Int}")
  #   else
  #     where(true)
  #   end
  # end

  def self.search(search)
    search_Int = search.to_i
    # binding.pry
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
