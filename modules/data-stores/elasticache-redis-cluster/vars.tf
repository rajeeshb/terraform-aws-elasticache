
/**
 * Required Variables.
 */

variable "project" {
  description = "Name of project."
}

variable "environment" {
  description = "Name of environment (i.e. dev, test, prod)."
}

variable "vpc_id" {
  description = "VPC id."
}

variable "subnet_ids" {
  description = "List of VPC Subnet IDs for the cache subnet group"
  type        = "list"
}

variable "availability_zones" {
  description = "A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important."
  type        = "list"
}

/**
 * Optional Variables.
 */

variable "replication_group_id_suffix" { 
  description = "Suffix for the replication_group_id value." 
  default = "rg" 
}

variable "number_cache_clusters" {
  description = "The number of cache clusters this replication group will have. If Multi-AZ is enabled , the value of this parameter must be at least 2. Changing this number will force a new resource"
  default     = "2"
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections."
  default     = "6379"
}

variable "engine_version" {
  description = "The version number of the cache engine to be used for the cache clusters in this replication group."
  default     = "3.2.4"
}

variable "parameter_group_name" {
  description = "The name of the parameter group to associate with this replication group. If this argument is omitted, the default cache parameter group for the specified engine is used."
  default     = "default.redis3.2.cluster.on"
}

variable "node_type" {
  description = "The compute and memory capacity of the nodes in the node group."
  default     = "cache.m3.medium"
}

variable "automatic_failover_enabled" {
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
  default = true
}

variable "maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"
  default     = "sun:05:00-sun:06:00"
}
