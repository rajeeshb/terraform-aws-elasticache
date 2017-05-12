/**
 * Outputs.
 */

output "configuration_endpoint_address" {
  value = "${aws_elasticache_replication_group.redis_replication_group.configuration_endpoint_address}"
}
