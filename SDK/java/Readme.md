# Create a new Maven Project
```sh
mvn archetype:generate \
-DarchetypeGroupId=software.amazon.awssdk \
-DarchetypeArtifactId=archetype-app-quickstart \
-DarchetypeVersion=2.20.43
```

# Enter next
```
Enter the value listed in the second column for each prompt.

Prompt	Value to enter
Define value for property 'service':	s3
Define value for property 'httpClient':	apache-client
Define value for property 'nativeImage':	false
Define value for property 'credentialProvider'	identity-center
Define value for property 'groupId':	org.example
Define value for property 'artifactId':	getstarted
Define value for property 'version' 1.0-SNAPSHOT:	<Enter>
Define value for property 'package' org.example:	<Enter>
```