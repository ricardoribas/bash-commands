#/bin/bash

EC2_INSTANCE_ID=$1
EC2_ACCOUNT_USER=$2
EC2_KEY_LOCATION=$3

# Retrieve information about the instance volumes
EC2_INSTANCE_INFO=$(aws ec2 describe-instances --instance-id $EC2_INSTANCE_ID)
EC2_VOLUME_ID=$(echo $EC2_INSTANCE_INFO | jq '.Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId' | tr -d '"')
EC2_INSTANCE_DNS_NAME=$(echo $EC2_INSTANCE_INFO | jq '.Reservations[0].Instances[0].PublicDnsName' | tr -d '"')

aws ec2 modify-volume --size 50 --volume-id $EC2_VOLUME_ID

EC2_INSTANCE_CONNECTION="$EC2_ACCOUNT_USER@$EC2_INSTANCE_DNS_NAME"

# Access the instance and expand the disk to comply to the new size
ssh -i $EC2_KEY_LOCATION $EC2_INSTANCE_CONNECTION "sudo file -s /dev/xvd* && lsblk && sudo growpart /dev/xvda 1 && sudo xfs_growfs /dev/xvda1"
