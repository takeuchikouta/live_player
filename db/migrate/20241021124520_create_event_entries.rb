class CreateEventEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :event_entries do |t|
      t.integer :event_id, null: false
      t.integer :applicant_id, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end
