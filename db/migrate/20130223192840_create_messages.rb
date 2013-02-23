class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :guildy_id
      t.integer :event_id
      t.string :message

      t.timestamps
    end
  end
end
