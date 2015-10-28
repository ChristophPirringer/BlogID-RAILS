class CreateUsersAndFoodAndExercise < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
    end
    create_table :exercises do |t|
      t.string :name
      t.integer :calories
    end
  end
end
