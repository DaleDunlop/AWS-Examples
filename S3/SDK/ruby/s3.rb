#https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Client.html
# Required gems
require 'aws-sdk-s3'  # Enables AWS S3 services interaction.
require 'pry'        # Debugging tool.
require 'securerandom'  # Generates unique identifiers (UUID).

# S3 Bucket Configuration
bucket_name = ENV['BUCKET_NAME']  # S3 Bucket name from environment variable.
region = 'eu-west-2'  # AWS region for the S3 bucket.

# Initialize AWS S3 client
client = Aws::S3::Client.new(region: region)

# Create a new S3 bucket
client.create_bucket({
  bucket: bucket_name,  # Name of the bucket to create.
  create_bucket_configuration: { location_constraint: region },  # Bucket region.
})

# Determine the number of files to upload (randomly between 1 and 7)
number_of_files = 1 + rand(6)
puts "Number of files to upload: #{number_of_files}"

# Upload process
number_of_files.times do |i|
  filename = "file_#{i}.txt"  # Construct file name.
  output_path = "/tmp/#{filename}"  # Temporary path for file creation.

  # Create a file with a unique UUID as content.
  File.open(output_path, "w") { |file| file.write(SecureRandom.uuid) }

  # Upload the file to S3
  File.open(output_path, 'rb') do |file|
    client.put_object(bucket: bucket_name, key: filename, body: file)
  end
  puts "Uploaded #{filename}"
end

