class Episode < ActiveRecord::Base
  #Episodes belong to a Program.
  belongs_to :program
  #An Episode has many notes.
  #If an Episode is deleted, delete its Notes.
  has_many :notes, :dependent => :destroy

end
