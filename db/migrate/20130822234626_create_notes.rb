class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note_text
      t.integer :episode_id

      t.timestamps
    end
  end
end
