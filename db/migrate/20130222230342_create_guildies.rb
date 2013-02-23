class CreateGuildies < ActiveRecord::Migration
  def change
    create_table :guildies do |t|
      t.string :name
      t.string :number
      t.boolean :backup

      t.timestamps
    end
  end
end
