# Private EC2

resource "aws_instance" "private" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.private.id
    availability_zone = "${data.aws_region.current.name}a"
    vpc_security_group_ids = [ aws_security_group.ssh.id, ]
    key_name = "first_key"
    tags = merge(
        local.comman_tags,
        tomap({ "Name" = "${local.prefix}-private_ec2" })
    )
  
}

# Public EC2

resource "aws_instance" "public" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [ aws_security_group.ssh.id]
    key_name = "first_key"
    availability_zone = "${data.aws_region.current.name}a"
    tags = merge(
        local.comman_tags,
        tomap({ "Name" = "${local.prefix}-public_ec2" })
    )
}