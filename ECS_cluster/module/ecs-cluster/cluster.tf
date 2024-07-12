// Cluster ECS

resource "aws_ecs_cluster" "cluster-ecs" {
  name = var.cluster_name
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
