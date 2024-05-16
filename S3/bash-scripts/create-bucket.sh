#!/usr/bin/env bash
echo "== create bucket"

# Check for bucket name
if [ -z "$1" ]; then
    echo "There needs to be a bucket name eg. ./bucket my-bucket-name"
    exit 1
fi

BUCKET_NAME="$1"

# Check if bucket already exists
if aws s3api head-bucket --bucket "$BUCKET_NAME" 2>/dev/null; then
    echo "Bucket $BUCKET_NAME already exists."
    exit 1
fi

# Create bucket
if ! aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --create-bucket-configuration "LocationConstraint=ca-central-1" \
    --query Location \
    --output text; then
    echo "Failed to create bucket $BUCKET_NAME."
    exit 1
fi

echo "Bucket $BUCKET_NAME created successfully."
