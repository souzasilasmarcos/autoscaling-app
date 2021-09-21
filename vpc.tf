resource "aws_vpc" "this" {
  cidr_block = "172.31.0.0/16"
  tags       = merge(local.common_tags, { Name = "Terraform VPC " })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "Terraform IGW " })
}

resource "aws_subnet" "this" {
  for_each = {
    "pub_a" : ["172.31.0.0/20", "${var.aws_region}a", "Public A"]
    "pub_b" : ["172.31.32.0/20", "${var.aws_region}b", "Public B"]
    "pvt_c" : ["172.31.16.0/20", "${var.aws_region}c", "Private C"]
    "pvt_a" : ["172.31.0.0/20",  "${var.aws_region}a", "Private A"]
    "pvt_b" : ["172.31.32.0/20", "${var.aws_region}b", "Private B"]
    "pvt_c" : ["172.31.16.0/20", "${var.aws_region}c", "Private C"]
	
  }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value[0]
  availability_zone = each.value[1]

  tags = merge(local.common_tags, { Name = each.value[2] })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(local.common_tags, { Name = "Terraform Public" })
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "Terraform Private" })
}

resource "aws_route_table_association" "this" {
  for_each = local.subnet_ids

  subnet_id      = each.value
  route_table_id = substr(each.key, 0, 3) == "Pub" ? aws_route_table.public.id : aws_route_table.private.id
}
