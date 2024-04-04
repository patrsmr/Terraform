# modules.tf

module "base_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace = 11
  stage     = var.stage
  name      = var.name
  attributes = ["subnet"]
}

