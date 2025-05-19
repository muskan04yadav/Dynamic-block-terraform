
locals {
  ingress_rules = [
    for port in var.ingress_ports : {
      from_port   = port
      to_port     = port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "web_sg" {
  source         = "./modules/security_group"
  vpc_id         = var.vpc_id
  sg_name        = var.sg_name
  ingress_rules  = local.ingress_rules
}