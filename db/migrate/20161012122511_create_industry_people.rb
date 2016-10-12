class CreateIndustryPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :industry_people do |t|
      t.string :name
      t.datetime :birthday
      t.integer :year_born
      t.string :birthplace

      t.timestamps
    end
    add_index :industry_people, :name, unique: false
  end
end
