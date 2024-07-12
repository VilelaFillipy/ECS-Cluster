module "ecs-cluster" {
  source = "./module/ecs-cluster"

  cluster_name = "${var.cliente}-cluster-${var.env}"
}

module "ecs-service" {
  source = "./module/ecs-service"

  launch_type   = "FARGATE"
  desired_count = 1
  service-name  = "${var.cliente}-service-${var.env}"
  cluster-id    = module.ecs-cluster.cluster_id
}