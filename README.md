# terraform-aws-elasticache

This repository is a set of Terraform modules for configuring cache systems with Redis on AWS.

## Quickstart

The easiest way to get the modules and running is by creating a Terraform definition for it, copy this snippet in a file
named `main.tf`:

```hcl
module "redis-cluster" {
  source = "git::https://github.com/tierratelematics/terraform-aws-elasticache.git//modules/data-stores/elasticache-redis-cluster?ref=0.1.0"

  aws                = "${var.aws}"
  environment        = "${var.environment}"
  project            = "${var.project}"
  subnet_ids         = ["${var.aws["public_1_subnet_id"]}", "${var.aws["public_2_subnet_id"]}"]
  availability_zones = "${var.availability_zones}"
}
```

## License

Copyright 2017 Tierra SpA

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.