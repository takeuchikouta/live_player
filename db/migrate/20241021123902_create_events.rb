class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :organizer_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      
      t.timestamps
    end
  end
end
