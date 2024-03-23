## Create a new s3 Bucket

```aws
aws s3 mb s3://checksums-examples-abc-123321
```

## Create a file that we will do a checksum on

```
echo  "Hello world" > myfile.txt
```

## Create a checksum of a file for md5

md5sum myfile.
# f0ef7081e1539ac00ef5b761b4fb01b3  myfile.txt

```
aws s3 cp myfile.txt s3://checksums-examples-abc-123321
aws s3api head-object --bucket checksums-examples-abc-123321 --key myfile.txt
```