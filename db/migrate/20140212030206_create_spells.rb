class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :level, null: false
    end
  end
end
