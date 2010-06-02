class Video < Asset
  has_attached_file :attachment,
                    :url => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  # Tell Paperclip to only process files if they are image files
  # See http://awesomeful.net/posts/33-attach-non-image-files-in-rails-with-paperclip
  before_post_process :image?

  # Method checks to see if the attchment is an image or not
  def image?
    !(self.attachment_content_type =~ /^image.*/).nil?
  end

  # if there are errors from the plugin, then add a more meaningful message
  def validate
    unless attachment.errors.empty?
      # uncomment this to get rid of the less-than-useful interrim messages
      # errors.clear
      errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
      false
    end
  end
end
