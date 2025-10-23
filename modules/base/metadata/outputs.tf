# modules/base/metadata/outputs.tf
output "resource_name" {
  description = "Standardized resource name"
  value       = "${var.application}-${var.component}-${var.region_short}-${var.environment}"
}

output "tags" {
  description = "Standardized tag map"
  value = {
    Environment = var.environment
    Application = var.application
    Component   = var.component
    Region      = var.region_short
    ManagedBy   = "terraform"
  }
}
