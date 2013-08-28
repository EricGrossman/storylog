class Note < ActiveRecord::Base
  #Notes belong to an Episode.
  belongs_to :episode
end
