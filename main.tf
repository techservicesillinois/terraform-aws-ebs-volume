variable "availability_zone" {
  description = "Availability zone for volume (NOTE: EC2 instance mounting volume must reside in the same AS as the volume created here"
}

variable "encrypted" {
  description = "Encryption"
  default     = true
}

variable "size" {
  description = "The size of the drive in GiBs"
}

variable "tags" {
  description = "Mapping of tags to assign to resources"
  default     = {}
}

resource "aws_ebs_volume" "default" {
  availability_zone = "${var.availability_zone}"
  encrypted         = "${var.encrypted}"
  size              = "${var.size}"
  tags              = "${var.tags}"

  lifecycle {
    prevent_destroy = true
  }
}

output "arn" {
  value = "${aws_ebs_volume.default.arn}"
}

output "id" {
  value = "${aws_ebs_volume.default.id}"
}
