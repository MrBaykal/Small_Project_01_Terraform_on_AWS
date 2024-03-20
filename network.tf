resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true 
    enable_dns_support = true

    tags = merge(
        local.comman_tags,
        tomap({ "Name" = "${local.prefix}-vpc" })
    )
  
}

resource "aws_subnet" "public" {
    cidr_block = var.subnet_cidr_list[0]
    map_public_ip_on_launch = true
    vpc_id = aws_vpc.main.id
    availability_zone = "${data.aws_region.current.name}a"  
  
}