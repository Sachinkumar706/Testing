moved {
  from = module.networking.aws_vpc.main
  to   = module.stackgen_38dee95a-ee08-5d3b-839e-a2b27a7479dd.aws_vpc.this
}

moved {
  from = module.web_tier.aws_autoscaling_group.web
  to   = module.stackgen_042c47b1-cdae-5de0-babe-3117fcd53322.aws_autoscaling_group.this
}

moved {
  from = module.security_groups.aws_security_group.app_ec2
  to   = module.stackgen_69bcb2f4-f165-50b6-9e60-a6f414bec3c8.aws_security_group.this
}

moved {
  from = module.networking.aws_subnet.private_app[1]
  to   = module.stackgen_5c2d762f-1ffa-5013-838c-d66db8575ff2.aws_subnet.this
}

moved {
  from = module.networking.aws_subnet.public[0]
  to   = module.stackgen_31c22de0-7317-5f43-b0a7-4ad1e404a5eb.aws_subnet.this
}

moved {
  from = module.app_tier.aws_autoscaling_group.app
  to   = module.stackgen_ac814bdf-8da8-53a7-9406-e7258b4a7f95.aws_autoscaling_group.this
}

moved {
  from = module.web_tier.aws_lb.web
  to   = module.stackgen_f6bfd7c9-dd5f-5bc2-b60c-367e92d73b85.aws_lb.this
}

moved {
  from = module.networking.aws_subnet.private_db[0]
  to   = module.stackgen_84454798-0715-5926-a934-0b822f0d4ab0.aws_subnet.this
}

moved {
  from = module.security_groups.aws_security_group.db
  to   = module.stackgen_1ac5767b-6a96-5157-8b21-574f663425e3.aws_security_group.this
}

moved {
  from = module.security_groups.aws_security_group.web_alb
  to   = module.stackgen_baa67614-4cd5-5d8e-ac3f-5dc77945f420.aws_security_group.this
}

moved {
  from = module.networking.aws_subnet.public[1]
  to   = module.stackgen_0e3f0968-ab1c-5ffc-acfc-9c4e57ac749d.aws_subnet.this
}

moved {
  from = module.database_tier.aws_rds_cluster.main
  to   = module.stackgen_b85fd7d1-a4d4-53ae-a475-77de03be5bea.aws_rds_cluster.this
}

moved {
  from = module.database_tier.aws_db_subnet_group.main
  to   = module.stackgen_25191d4c-223d-59d5-93c6-47068109c8b5.aws_db_subnet_group.this
}

moved {
  from = module.networking.aws_nat_gateway.main
  to   = module.stackgen_ec2ce63e-55be-57ed-8a84-656213d5c1d5.aws_nat_gateway.this
}

moved {
  from = module.security_groups.aws_security_group.web_ec2
  to   = module.stackgen_75253781-19e1-5dee-9f82-cdac7930171d.aws_security_group.this
}

moved {
  from = module.networking.aws_subnet.private_app[0]
  to   = module.stackgen_32cebb77-5772-598f-9ae5-1d5f7259e3b8.aws_subnet.this
}

moved {
  from = module.networking.aws_subnet.private_db[1]
  to   = module.stackgen_ac86da26-1d4e-5416-a9d0-595871aa4395.aws_subnet.this
}

moved {
  from = module.networking.aws_internet_gateway.main
  to   = module.stackgen_e22b75d7-7919-5b28-98b8-6f0a660b433f.aws_internet_gateway.this
}

moved {
  from = module.app_tier.aws_lb.app
  to   = module.stackgen_b61bde4f-036a-58ae-869e-bcb112b171f3.aws_lb.this
}


################################################################################

