import { Stack, StackProps } from 'aws-cdk-lib';
import * as s3 from 'aws-cdk-lib/aws-s3';
import { Construct } from 'constructs';

export class CdkStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);
    // Correct usage: pass 'this' as the scope to the Bucket constructor.
    new s3.Bucket(this, 'MyBucket');
  }
}
