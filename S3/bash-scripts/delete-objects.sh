#!/usr/bin/env bash
echo "== delete-objects"

# Exit immediately if any command returns a non-zero status
set -e

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

BUCKET_NAME="$1"

# Delete all objects in the bucket
aws s3api list-objects --bucket "$BUCKET_NAME"  \
--query Contents[].Key \
| jq -n '{Objects: [inputs | .[] | {Key: .}]}' > /tmp/delete_objects.json

aws s3api delete-objects --bucket "$BUCKET_NAME" --delete file:///tmp/delete_objects.json
