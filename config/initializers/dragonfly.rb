require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
# pictures_app = Dragonfly.app(:sm_portfolio_pictures)
# pictures_app.configure_with(:imagemagick)
# pictures_app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "38ef643bcdd14f26f9526e8a44a4da54a28682b885e6931c132b3e27d87d491e"

  url_format "/media/:job/:name"

  response_header 'Content-Disposition' do |job, request, headers|
    "attachment; #{headers['Content-Disposition']}"
  end

  if Rails.env.test? || Rails.env.development?
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  else
    datastore :s3,
      bucket_name: ENV["S3_BUCKET_NAME"],
      access_key_id: ENV["S3_ACCESS_KEY"],
      secret_access_key: ENV["S3_SECRET_KEY"],
      storage_headers: {'x-amz-acl' => 'public-read'},
      url_scheme: 'https'
      # region: 'us-west-2'
      # url_host: '{s3.amazonaws.com/'ENV["S3_BUCKET_NAME"]}'' # ENV["S3_BUCKET_NAME"].s3.amazonaws.com
  end
end

# Dragonfly.app.store(some_file, path: 'some/path.txt', headers: {'x-amz-acl' => 'public-read-write'})

# Logger
Dragonfly.logger = Rails.logger

# If the datastore supports it, you can get the URL for serving directly from the data store using
# url = Dragonfly.app.remote_url_for(uid) # TODO: refer to http://stackoverflow.com/questions/22008030/serving-images-remotely-or-directly-the-amazon-s3-dragonfly-gem

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
