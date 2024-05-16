## Create a new folder

```sh
aws s3 mb s3://object-lock-fun-ab-123321
```

## Turn on versioning
```sh
aws s3api put-bucket-versioning --bucket object-lock-fun-ab-123321 --versioning-configuration Status=Enabled
```

# Turn on object locking

```sh
aws s3api put-object-lock-configuration \
--bucket object-lock-fun-ab-123321 \
--object-lock-configuration '{ "ObjectLockEnabled": "Enabled", "Rule": { "DefaultRetention": { "Mode": "GOVERNANCE", "Days": 1}}}'
```
## New file

echo "this is the gov" > gov.txt

## Upload File

 aws s3 cp gov.txt s3://object-lock-fun-ab-123321

 
