class AddPhotoExtensionToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :photo_extension, :text

  end
end
