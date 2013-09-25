class AddPhotoDetailsToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :photo_file_name, :string

    add_column :programs, :photo_content_type, :string

    add_column :programs, :photo_file_size, :integer

    add_column :programs, :photo_updated_at, :datetime

  end
end
