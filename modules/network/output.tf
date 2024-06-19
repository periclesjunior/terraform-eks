output "pub_subnet_1a" {
  value = aws_subnet.eks_public_subnet_1a.id
}

output "pub_subnet_1b" {
  value = aws_subnet.eks_public_subnet_1b.id
}

output "priv_subnet_1a" {
  value = aws_subnet.eks_private_subnet_1a.id
}

output "priv_subnet_1b" {
  value = aws_subnet.eks_private_subnet_1b.id
}