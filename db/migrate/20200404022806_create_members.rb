class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.string :tel, :limit => 13, null: false
      t.date :birthday, null: false
      t.string :postcode, :limit => 8, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building, null: false
      t.string :secularname
      t.text :dharmaname
      t.date :deceased
      t.boolean :spring
      t.boolean :summer
      t.boolean :autumn
      t.boolean :winter
      t.timestamps
    end
  end
end
