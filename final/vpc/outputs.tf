output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnets_id" {
  value = aws_subnet.public[*].id
}

