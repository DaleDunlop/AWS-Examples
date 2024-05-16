#Create our bucket
```sh
aws s3 mb s3://prefixes-fun-ab-523343
```

#Create our folder
```sh
aws s3api put-object --bucket"prefixes-fun-ab-523343" --keys="hello/"
```

#Create many folders
```sh
aws s3api put-object --bucket"prefixes-fun-ab-523343" --keys="hello/test/test1/test2/test3/test4"
```