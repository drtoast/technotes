# http://www.engineyard.com/blog/2011/a-gentle-introduction-to-carrierwave/
# gem install carrierwave

require 'carrierwave'

class MyUploader < CarrierWave::Uploader::Base
  storage :file
  
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
  
  def store_dir
    'public/my/upload/directory'
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end

post '/' do
  upload = Upload.new
  upload.file = params[:image]
  upload.save
  redirect to('/')
end

__END__

@@ index
<!DOCTYPE html>
<html>
  <body>
    <form action="/" method="post" enctype="multipart/form-data"></div>
      <p><input type="file" name="image" /></p>
      <p><input type="submit" name="submit" value="Upload" /></p>
    </form>
    <% @uploads.each do |upload| %>
      <img src="<%= upload.file.url %>" />
    <% end %>
  </body>
</html>