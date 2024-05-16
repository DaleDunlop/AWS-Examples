# frozen_string_literal: true

# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Client.html
# Required gems
require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

# S3 Bucket Configuration
bucket_name = ENV['BUCKET_NAME']
region = 'eu-west-2'

# Initialize AWS S3 client
client = Aws::S3::Client.new(region: region)

# Create a new S3 bucket
client.create_bucket(
  {
    bucket: bucket_name,
    create_bucket_configuration: { location_constraint: region }
  }
)

# Determine the number of files to upload (randomly between 1 and 7)
number_of_files = 1 + rand(6)
puts "Number of files to upload: #{number_of_files}"

# Upload process
number_of_files.times do |i|
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # Create a file with a unique UUID as content.
  File.open(output_path, 'w') { |file| file.write(SecureRandom.uuid) }

  # Upload the file to S3
  File.open(output_path, 'rb') do |file|
    client.put_object(bucket: bucket_name, key: filename, body: file)
  end
  puts "Uploaded #{filename}"
end
