module "stackgen_042c47b1-cdae-5de0-babe-3117fcd53322" {
  source                           = "./modules/aws_autoscaling_group"
  capacity_rebalance               = null
  desired_capacity                 = 2
  desired_capacity_type            = null
  enabled_metrics                  = null
  force_delete                     = null
  force_delete_warm_pool           = null
  health_check_grace_period        = 300
  health_check_type                = "EC2"
  ignore_failed_scaling_activities = null
  launch_configuration             = null
  launch_template = {
    id      = "lt-0web1a2b3c4d5e6f7"
    version = "$Latest"
  }
  max_instance_lifetime     = null
  max_size                  = 6
  min_size                  = 2
  mixed_instances_policy    = []
  protect_from_scale_in     = null
  suspended_processes       = null
  tag                       = []
  target_group_arns         = null
  termination_policies      = null
  timeouts                  = null
  vpc_zone_identifier       = ["subnet-0pub1a2b3c4d5e6f7", "subnet-0pub2b3c4d5e6f7a8"]
  wait_for_capacity_timeout = "10m"
}

module "stackgen_0e3f0968-ab1c-5ffc-acfc-9c4e57ac749d" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1b"
    Tier = "Web"
  }
  vpc_id = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_1ac5767b-6a96-5157-8b21-574f663425e3" {
  source      = "./modules/aws_security_group"
  description = "Managed by Terraform."
  egress = [{
    cidr_blocks = ["10.0.0.0/16"]
    description = "Allow outbound within VPC only"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = "FIX SECURITY_GROUP_028: TCP 5432 from app-ec2-sg only, was 0.0.0.0/0"
    from_port        = 5432
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = ["04609145-5818-44ea-9f97-505b2f3c6319"]
    to_port          = 5432
  }]
  name                   = "db-sg"
  revoke_rules_on_delete = false
  tags = {
    Name = "db-sg"
    Tier = "Database"
  }
  timeouts = null
  vpc_id   = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_25191d4c-223d-59d5-93c6-47068109c8b5" {
  source      = "./modules/aws_db_subnet_group"
  description = "Managed by Terraform"
  name        = "three-tier-db-subnet-group"
  name_prefix = null
  subnet_ids = [
    module.stackgen_ac86da26-1d4e-5416-a9d0-595871aa4395.id,
    module.stackgen_84454798-0715-5926-a934-0b822f0d4ab0.id,
  ]
  tags = {
    Name = "three-tier-db-subnet-group"
  }
}

module "stackgen_31c22de0-7317-5f43-b0a7-4ad1e404a5eb" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1a"
    Tier = "Web"
  }
  vpc_id = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_32cebb77-5772-598f-9ae5-1d5f7259e3b8" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "app-subnet-1a"
    Tier = "App"
  }
  vpc_id = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Environment = "production"
    Name        = "three-tier-vpc"
  }
}

module "stackgen_5c2d762f-1ffa-5013-838c-d66db8575ff2" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "app-subnet-1b"
    Tier = "App"
  }
  vpc_id = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_69bcb2f4-f165-50b6-9e60-a6f414bec3c8" {
  source      = "./modules/aws_security_group"
  description = "Managed by Terraform."
  egress = [{
    cidr_blocks = ["10.0.0.0/16"]
    description = "Allow outbound within VPC only"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = "FIX SECURITY_GROUP_030: TCP 8080 from web-ec2-sg only, was 0.0.0.0/0"
    from_port        = 8080
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = ["42ea7b3f-6f94-451e-bef4-71c68e2203c7"]
    to_port          = 8080
  }]
  name                   = "app-ec2-sg"
  revoke_rules_on_delete = false
  tags = {
    Name = "app-ec2-sg"
    Tier = "App"
  }
  timeouts = null
  vpc_id   = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_75253781-19e1-5dee-9f82-cdac7930171d" {
  source      = "./modules/aws_security_group"
  description = "Managed by Terraform."
  egress = [{
    cidr_blocks = ["10.0.0.0/16"]
    description = "Allow outbound within VPC only"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = "FIX SECURITY_GROUP_045: TCP 80 from web-alb-sg only, was 0.0.0.0/0"
    from_port        = 80
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = ["9a90e067-bd81-4af3-86c4-58c3475a0fde"]
    to_port          = 80
    }, {
    cidr_blocks      = []
    description      = "FIX SECURITY_GROUP_046: TCP 443 from web-alb-sg only, was 0.0.0.0/0"
    from_port        = 443
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = ["9a90e067-bd81-4af3-86c4-58c3475a0fde"]
    to_port          = 443
    }, {
    cidr_blocks      = []
    description      = "FIX SECURITY_GROUP_030: TCP 8080 from web-alb-sg only, was 0.0.0.0/0"
    from_port        = 8080
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = ["9a90e067-bd81-4af3-86c4-58c3475a0fde"]
    to_port          = 8080
  }]
  name                   = "web-ec2-sg"
  revoke_rules_on_delete = false
  tags = {
    Name = "web-ec2-sg"
    Tier = "Web"
  }
  timeouts = null
  vpc_id   = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_84454798-0715-5926-a934-0b822f0d4ab0" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "db-subnet-1a"
    Tier = "Database"
  }
  vpc_id = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_ac814bdf-8da8-53a7-9406-e7258b4a7f95" {
  source                           = "./modules/aws_autoscaling_group"
  capacity_rebalance               = null
  desired_capacity                 = 2
  desired_capacity_type            = null
  enabled_metrics                  = null
  force_delete                     = null
  force_delete_warm_pool           = null
  health_check_grace_period        = 300
  health_check_type                = "EC2"
  ignore_failed_scaling_activities = null
  launch_configuration             = null
  launch_template = {
    id      = "lt-0app1a2b3c4d5e6f7"
    version = "$Latest"
  }
  max_instance_lifetime     = null
  max_size                  = 6
  min_size                  = 2
  mixed_instances_policy    = []
  protect_from_scale_in     = null
  suspended_processes       = null
  tag                       = []
  target_group_arns         = null
  termination_policies      = null
  timeouts                  = null
  vpc_zone_identifier       = ["subnet-0app1a2b3c4d5e6f7", "subnet-0app2b3c4d5e6f7a8"]
  wait_for_capacity_timeout = "10m"
}

module "stackgen_ac86da26-1d4e-5416-a9d0-595871aa4395" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "db-subnet-1b"
    Tier = "Database"
  }
  vpc_id = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_b61bde4f-036a-58ae-869e-bcb112b171f3" {
  source                     = "./modules/aws_lb"
  access_logs                = []
  enable_deletion_protection = false
  enable_http2               = true
  internal                   = true
  load_balancer_type         = "application"
  name                       = "app-alb"
  security_groups = [
    module.stackgen_69bcb2f4-f165-50b6-9e60-a6f414bec3c8.id,
  ]
  subnets = [
    module.stackgen_5c2d762f-1ffa-5013-838c-d66db8575ff2.id,
    module.stackgen_32cebb77-5772-598f-9ae5-1d5f7259e3b8.id,
  ]
  tags = {
    Name = "app-alb"
    Tier = "App"
  }
}

module "stackgen_b85fd7d1-a4d4-53ae-a475-77de03be5bea" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = []
  backup_retention_period            = 7
  cluster_identifier                 = "three-tier-db-cluster"
  copy_tags_to_snapshot              = false
  database_name                      = "appdb"
  db_subnet_group_name               = module.stackgen_25191d4c-223d-59d5-93c6-47068109c8b5.name
  enable_global_write_forwarding     = null
  enable_local_write_forwarding      = null
  enabled_cloudwatch_logs_exports    = null
  engine                             = "aurora-postgresql"
  engine_mode                        = null
  engine_version                     = "15.3"
  global_cluster_identifier          = null
  kms_key_id                         = null
  master_password                    = null
  master_username                    = "dbadmin"
  preferred_backup_window            = "02:00-03:00"
  preferred_maintenance_window       = "sun:05:00-sun:06:00"
  scaling_configuration              = []
  serverlessv2_scaling_configuration = []
  skip_final_snapshot                = null
  storage_encrypted                  = true
  tags = {
    Name = "three-tier-db"
    Tier = "Database"
  }
  vpc_security_group_ids = [
    module.stackgen_1ac5767b-6a96-5157-8b21-574f663425e3.id,
  ]
}

module "stackgen_baa67614-4cd5-5d8e-ac3f-5dc77945f420" {
  source      = "./modules/aws_security_group"
  description = "Managed by Terraform."
  egress = [{
    cidr_blocks = ["10.0.0.0/16"]
    description = "Allow outbound within VPC only"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }]
  ingress = [{
    cidr_blocks      = ["10.0.0.0/16"]
    description      = "FIX SECURITY_GROUP_045: TCP 80 restricted to VPC CIDR only, was 0.0.0.0/0"
    from_port        = 80
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = []
    to_port          = 80
    }, {
    cidr_blocks      = []
    description      = "FIX SECURITY_GROUP_030: TCP 8080 restricted to web-ec2-sg only, was 0.0.0.0/0"
    from_port        = 8080
    ipv6_cidr_blocks = []
    protocol         = "tcp"
    security_groups  = ["42ea7b3f-6f94-451e-bef4-71c68e2203c7"]
    to_port          = 8080
  }]
  name                   = "web-alb-sg"
  revoke_rules_on_delete = false
  tags = {
    Name = "web-alb-sg"
    Tier = "Web"
  }
  timeouts = null
  vpc_id   = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_e22b75d7-7919-5b28-98b8-6f0a660b433f" {
  source = "./modules/aws_internet_gateway"
  tags = {
    Name = "three-tier-igw"
  }
  vpc_id = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.id
}

module "stackgen_ec2ce63e-55be-57ed-8a84-656213d5c1d5" {
  source                             = "./modules/aws_nat_gateway"
  allocation_id                      = "eipalloc-0a1b2c3d4e5f6789"
  connectivity_type                  = null
  private_ip                         = null
  secondary_allocation_ids           = null
  secondary_private_ip_address_count = null
  secondary_private_ip_addresses     = null
  subnet_id                          = module.stackgen_31c22de0-7317-5f43-b0a7-4ad1e404a5eb.id
  tags = {
    Name = "three-tier-nat"
  }
  timeouts = null
}

module "stackgen_f422db97-2ebb-42a7-bc15-df522cf149cb" {
  source        = "./modules/aws_external"
  arn           = null
  resource_type = null
}

module "stackgen_f6bfd7c9-dd5f-5bc2-b60c-367e92d73b85" {
  source                     = "./modules/aws_lb"
  access_logs                = []
  enable_deletion_protection = false
  enable_http2               = true
  internal                   = false
  load_balancer_type         = "application"
  name                       = "web-alb"
  security_groups = [
    module.stackgen_baa67614-4cd5-5d8e-ac3f-5dc77945f420.id,
  ]
  subnets = [
    module.stackgen_0e3f0968-ab1c-5ffc-acfc-9c4e57ac749d.id,
    module.stackgen_31c22de0-7317-5f43-b0a7-4ad1e404a5eb.id,
  ]
  tags = {
    Name = "web-alb"
    Tier = "Web"
  }
}

