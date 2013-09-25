class Program < ActiveRecord::Base
  
  attr_accessible :name, :photo
  attr_accessor :photo_file_name
  attr_accessor :photo_content_type
  attr_accessor :photo_file_size
  attr_accessor :photo_updated_at
  #A Program has many Episodes.
  #If a Program is deleted, delete its Episodes.
  has_many :episodes, :dependent => :destroy
  
  #Call store_photo method after saving Program record.
  #after_save :store_photo
  
  
  
  #Create path to Rails' public directory
  PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'
  
  has_attached_file :photo, 
                    :url => "https://s3.amazonaws.com/StorylogBucket/app/public/assets/photo_store/:basename.:extension",
					:path => ":rails_root/public/assets/photo_store/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  
  #Where should the image file be written?
  #File name is in Program id.extension format
  #def photo_filename
    #File.join PHOTO_STORE, "#{id}.#{photo_extension}"
  #end
  
  #Give a URL to display the image on the page.
  #def photo_path
    #"/photo_store/#{id}.#{photo_extension}"
  #end
  
  #Is there a photo?
  def has_photo?
    File.exists? photo_filename
  end
  
  #Store file data in :photo attribute, get the extension.
  #def photo=(file_data)
    #unless file_data.blank?
	  #Store the uploaded data in an instance variable.
	  #@file_data = file_data
	  #Get the file extension to store in the database, then
	  #assign to the current Program object's photo_extension property.
	  #self.photo_extension = file_data.original_filename.split('.').last.downcase
	#end
  #end
  
  #private
  #All methods below "private" keyword will be private.
  
  #After saving, write the uploaded image to file.
  #This method uses the @file_data instance variable created in photo().
  #def store_photo
    #Is there file data?
    #if @file_data
	  #Create the photo directory if it doesn't exist.
	  #FileUtils.mkdir_p PHOTO_STORE
	  #Write image data to file.
	  #File.open(photo_filename, 'wb') do |f|
	    #f.write(@file_data.read)
	  #end
	  #Make sure the file is stored just once, right now.
	  #@file_data = nil	
	#end  
  #end
end
