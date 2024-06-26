#!/usr/bin/env bash
echo "== list objects"

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

BUCKET_NAME="$1"

# List objects in the bucket
aws s3api list-objects --bucket "$BUCKET_NAME"
