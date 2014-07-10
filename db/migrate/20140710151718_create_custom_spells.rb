class CreateCustomSpells < ActiveRecord::Migration
  def change
    create_table :custom_spells do |t|
      t.string :name, null: false
      t.integer :level, null: false
      t.string :school, null: false
      t.string :casting_time, null: false
      t.string :components, null: false
      t.string :range
      t.string :area
      t.string :target, null: false
      t.string :duration, null: false
      t.string :saving_throw
      t.string :spell_resistance
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
