provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "c92dde260ea26f140fa4a810b97a71dcb697151f"
    git_file             = "terraform/simple_instance/ec2-2.tf"
    git_last_modified_at = "2021-12-07 13:28:57"
    git_last_modified_by = "95222720+dompanw@users.noreply.github.com"
    git_modifiers        = "95222720+dompanw"
    git_org              = "dompanw"
    git_repo             = "terragoat"
    yor_trace            = "3a5d7f27-c34b-43ad-b7d3-1a2595c04250"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "c92dde260ea26f140fa4a810b97a71dcb697151f"
    git_file             = "terraform/simple_instance/ec2-2.tf"
    git_last_modified_at = "2021-12-07 13:28:57"
    git_last_modified_by = "95222720+dompanw@users.noreply.github.com"
    git_modifiers        = "95222720+dompanw"
    git_org              = "dompanw"
    git_repo             = "terragoat"
    yor_trace            = "518e9f7c-5c8a-4343-9a80-3cfd035f0ee1"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
