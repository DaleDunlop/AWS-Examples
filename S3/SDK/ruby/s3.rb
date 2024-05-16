#https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Client.html
# Required gems
require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
region = 'eu-west-2'

client = Aws::S3::Client.new(region: region)

begin
  client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: { location_constraint: region },
  })
rescue Aws::S3::Errors::BucketAlreadyExists
  puts "Bucket #{bucket_name} already exists."
  exit 1
end

number_of_files = 1 + rand(6)
puts "Number of files to upload: #{number_of_files}"

number_of_files.times do |i|
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  File.open(output_path, "w") { |file| file.write(SecureRandom.uuid) }

  File.open(output_path, 'rb') do |file|
    client.put_object(bucket: bucket_name, key: filename, body: file)
  end
  puts "Uploaded #{filename}"
end