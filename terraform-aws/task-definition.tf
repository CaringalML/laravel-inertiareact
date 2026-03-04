resource "aws_ecs_task_definition" "main" {
  family                   = var.project_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  # ARM64 / Graviton - same as what you set in console
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "ARM64"
  }

  container_definitions = jsonencode([
    {
      name      = var.project_name
      image     = var.container_image
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]

      environment = [
        { name = "APP_NAME", value = var.app_name },
        { name = "APP_ENV", value = var.app_env },
        { name = "APP_KEY", value = var.app_key },
        { name = "APP_DEBUG", value = var.app_debug },
        { name = "APP_URL", value = var.app_url },
        { name = "DB_CONNECTION", value = var.db_connection },
        { name = "DB_HOST", value = var.db_host },
        { name = "DB_PORT", value = var.db_port },
        { name = "DB_DATABASE", value = var.db_database },
        { name = "DB_USERNAME", value = var.db_username },
        { name = "DB_PASSWORD", value = var.db_password },
        { name = "DB_SSLMODE", value = var.db_sslmode },
        { name = "SESSION_DRIVER", value = "database" },
        { name = "CACHE_STORE", value = "database" },
        { name = "QUEUE_CONNECTION", value = "database" },
        { name = "LOG_CHANNEL", value = "stack" },
        { name = "LOG_STACK", value = "single" },
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = {
    Name = "${var.project_name}-task-definition"
  }
}
