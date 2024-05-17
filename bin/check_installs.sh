#!/usr/bin/env bash
# Add Pulumi to PATH
export PATH=$PATH:$HOME/.pulumi/bin
clear
neofetch
echo "------------------------------------------------"
echo "Versions:"
echo "---------"
aws --version || echo "AWS CLI not found."
echo "--------------------------------------------------------------------------------"
terraform version || echo "Terraform not found."
echo "----------------"
pwsh --version || echo "PowerShell not found."
echo "----------------"
echo "CDK"
cdk --version || echo "CDK not found."
echo "----------------"
echo "Pulumi"
pulumi version || echo "Pulumi not found."