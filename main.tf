##### FIXME: Try to simplify this code.

locals {
  name    = try(var.name, lookup(var.tags, "Name", null, null))
  service = try(lookup(var.tags, "Service", null), null)
  tags    = local.name != null && local.service != null ? merge({ Name = format("%s:%s", local.service, local.name) }, var.tags) : var.tags
}

resource "aws_ebs_volume" "default" {
  availability_zone = var.availability_zone
  encrypted         = var.encrypted
  iops              = var.iops
  size              = var.size
  tags              = local.tags
  throughput        = var.throughput
  type              = var.type

  lifecycle {
    prevent_destroy = true
  }
}
