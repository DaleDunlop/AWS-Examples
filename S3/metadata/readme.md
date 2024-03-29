## Create bucket

aws s3 mb s3://metadata-fun-ab-1233214

## Create new file

echo "Hello Mars" > hello.txt

## Upload file with metadata

aws s3api put-object --bucket metadata-fun-ab-1233214 --key hello.txt --body hello.txt --metadata Planet=Mars

## Get metadata through head-object

aws s3api head-object --bucket metadata-fun-ab-1233214 --key hello.txt

## Clean up buckets

aws s3 rm s3://metadata-fun-ab-1233214/hello.txt
aws s3 rb s3://metadata-fun-ab-1233214