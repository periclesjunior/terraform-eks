output "subnet_pub_1a" {
  value = aws_subnet.eks_subnet_public_1a.id
}

output "subnet_pub_1b" {
  value = aws_subnet.eks_subnet_public_1b.id
}

output "priv_subnet_1a" {
  value = aws_subnet.eks_private_subnet_1a.id
}

output "priv_subnet_1b" {
  value = aws_subnet.eks_private_subnet_1b.id
}