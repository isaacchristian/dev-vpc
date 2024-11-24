<a href="https://terraform.io">
    <img src=".github/terraform_logo.svg" alt="Terraform logo" title="Terraform" align="right" height="50" />
</a>

# Terraform aws-vpc

This configuration deploys a vpc, subnet, EC2 instance, an internet gateway, as well as a dynamic block nested within a security group. It's configured with the AWS plug-in for the configuration resources, and a terraform block as the state backend.

## Pre-requisites

[Install Terraform]([url](https://developer.hashicorp.com/terraform/install)) to your local machine. 

If using a **macOS**:

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

If using **Windows**, please follow this [link](https://developer.hashicorp.com/terraform/install) for a binary download. 

If using **Linux**, please follow the appropriate package manager:

**Ubuntu/Debian**
```
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

**CentOS/RHEL**
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

**Fedora**
```
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install terraform
```

**Amazon Linux**
```
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
```

**Homebrew**
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## Documentation

- Terraform Website: [terraform.io](https://terraform.io)
- Provider Documentation: [Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest)
- AWS Services Tutorial: [developer.hashicorp.com](https://developer.hashicorp.com/terraform/tutorials/aws)
