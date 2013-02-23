class CreatEventsGuildiesTable < ActiveRecord::Migration
  def self.up
      create_table :events_guildies, :id => false do |t|
          t.references :event
          t.references :guildy
      end
      add_index :events_guildies, [:event_id, :guildy_id]
      add_index :events_guildies, [:guildy_id, :event_id]
    end

    def self.down
      drop_table :events_guildies
    end
end
