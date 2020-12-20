class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.string :user_id
      t.timestamps
    end

    add_index :plants, :user_id
  end
end
