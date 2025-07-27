data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
  //  owners = ["491085422298"]
}

output "amazon_linux_ami_id" {
  description = "The latest Amazon Linux 2 AMI ID"
  value       = data.aws_ami.amazon_linux.id
}
