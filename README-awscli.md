


# Authenticate
$ aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 596906176357.dkr.ecr.ap-northeast-2.amazonaws.com

# Create ECR repo
$ aws ecr create-repository --repository-name opencv-yolo-stream --image-scanning-configuration scanOnPush=true --region ap-northeast-2

# Tag the image to push to your repository.
$ docker tag yolov3:0.1 596906176357.dkr.ecr.ap-northeast-2.amazonaws.com/opencv-yolo-stream:latest
$ docker tag yolov3-k8s:0.1 596906176357.dkr.ecr.ap-northeast-2.amazonaws.com/opencv-yolo-stream:latest-k8s

# Push
$ docker push 596906176357.dkr.ecr.ap-northeast-2.amazonaws.com/opencv-yolo-stream:latest

# Pull
$ docker pull 596906176357.dkr.ecr.ap-northeast-2.amazonaws.com/opencv-yolo-stream:latest

# Delete image
$ aws ecr batch-delete-image --repository-name opencv-yolo-stream --image-ids imageTag=latest --region ap-northeast-2

# Delete ECR repo
$ aws ecr delete-repository --repository-name opencv-yolo-stream --force --region ap-northeast-2

# List ECR repo
$ aws ecr describe-repositories

# List image
$ aws ecr list-images --repository-name opencv-yolo-stream

# Create role
$ aws iam create-role --role-name SagemakerRole --assume-role-policy-document file://./role-policy.json
# arn:aws:iam::596906176357:role/SagemakerRole"

# Attach Policy
$ aws iam attach-role-policy --role-name SagemakerRole --policy-arn arn:aws:iam::aws:policy/AmazonSageMakerFullAccess

# Add S3-data-bucket permission
aws iam put-role-policy --role-name SagemakerRole --policy-name S3DataBucketPolicy --policy-document file://./s3-data-bucket-policy.json

sm-docker build . --repository opencv-yolo-stream:latest --role arn:aws:iam::596906176357:role/service-role/AmazonSageMaker-ExecutionRole-20210924T220284 --bucket opencv-yolo-stream