/**
 * Outputs.
 */

output "id" {
  value = "${aws_elasticache_replication_group.redis_replication_group.id}"
}

output "configuration_endpoint_address" {
  value = "${aws_elasticache_replication_group.redis_replication_group.configuration_endpoint_address}"
}

output "primary_endpoint_address" {
  value = "${aws_elasticache_replication_group.redis_replication_group.primary_endpoint_address}"
}

output "port" {
  value = "${aws_elasticache_replication_group.redis_replication_group.port}"
}
