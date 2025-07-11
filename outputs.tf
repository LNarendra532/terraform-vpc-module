output "vpc_id" {
    value = aws_vpc.main.id
  
}

output "public_subnet_ids" {
    value = aws_subnet.public[*].id  # getting all cidrs
  
}

output "private_subnet_ids" {
    value = aws_subnet.private[*].id  # getting all cidrs
  
}

output "database_subnet_ids" {
    value = aws_subnet.database[*].id  # getting all cidrs
  
}