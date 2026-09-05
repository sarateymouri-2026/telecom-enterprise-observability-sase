output "monitoring_node_public_ip" {
  description = "Public IP address of SATECH Grafana/Prometheus Node"
  value       = aws_instance.monitoring_node.public_ip
}
