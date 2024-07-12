// Service ECS
resource "aws_ecs_service" "cluster-ecs-service" {
  name            = var.service-name
  cluster         = var.cluster-id
  task_definition = aws_ecs_task_definition.taskD.arn
  desired_count   = var.desired_count
  launch_type     = var.launch_type
  network_configuration {
    subnets = [ "subnet-0cdfb48164a4fa9bf" ]
  }
}

//Task Definition ECS
resource "aws_ecs_task_definition" "taskD" {
  family                   = "test"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = <<TASK_DEFINITION
        [
          {
            "name": "nginx",
            "image": "nginx:latest",
            "cpu": 1024,
            "memory": 2048,
            "essential": true
          }
        ]
TASK_DEFINITION
}