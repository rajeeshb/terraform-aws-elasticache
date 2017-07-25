terraform {
  required_version = ">= 0.9, < 0.10"
}

/**
 * Resources.
 */

resource "aws_security_group" "redis" {
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = "${var.port}"
    to_port     = "${var.port}"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.project}_${var.environment}_elasticache_sg"
    environment = "${var.environment}"
    application = "${var.project}"
  }
}

resource "aws_elasticache_replication_group" "redis_replication_group" {
  replication_group_id          = "${replace(replace(join("-",list(var.project,var.environment,var.replication_group_id_suffix)),"/(.{0,20})(.*)/","$1"),"/[-]*$/","")}"
  replication_group_description = "${var.project} ${var.environment} replication group"
  node_type                     = "${var.node_type}"
  number_cache_clusters         = "${var.number_cache_clusters}"
  port                          = "${var.port}"
  parameter_group_name          = "${var.parameter_group_name}"
  availability_zones            = ["${var.availability_zones}"]
  automatic_failover_enabled    = "${var.automatic_failover_enabled}"
  subnet_group_name             = "${aws_elasticache_subnet_group.default.name}"
  security_group_ids            = ["${aws_security_group.redis.id}"]

  tags {
    Name       = "${var.project}-${var.environment}-redis-replication-group"
    Project    = "${var.project}"
    Deployment = "${var.environment}"
  }
}

resource "aws_elasticache_subnet_group" "default" {
  name        = "${var.project}-${var.environment}-elasticache-subnet-group"
  description = "Private subnets for the ElastiCache instances: ${var.project} ${var.environment}"
  subnet_ids  = "${var.subnet_ids}"
}
