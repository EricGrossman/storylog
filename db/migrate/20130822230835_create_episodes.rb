class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :rating
      t.string :synopsis

      t.timestamps
    end
  end
end
