output "vpc_id" {
  description = "El ID de la VPC creada."
  value       = aws_vpc.myd_vpc.id
}

output "public_subnet_ids" {
  description = "La lista de IDs de las subredes públicas."
  value       = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

output "private_subnet_ids" {
  description = "La lista de IDs de las subredes privadas."
  value       = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}