#!/usr/bin/env bash
echo "== delete bucket"

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

BUCKET_NAME="$1"

# Delete bucket
aws s3api delete-bucket --bucket "$BUCKET_NAME"
