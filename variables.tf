variable "availability_zone" {
  description = "Availability zone for volume (NOTE: EC2 instance mounting volume must reside in the same AZ as the volume created here)"
}

variable "encrypted" {
  description = "Encryption"
  default     = true
}

variable "iops" {
  description = "Amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3"
  type        = number
  default     = null
}

variable "name" {
  description = "Name for volume (good choice is basename of mount point)"
  type        = string
  default     = null
}

variable "size" {
  description = "Size of volume in GiBs"
  type        = number
}

variable "throughput" {
  description = "Throughput supported by volume in MiB/s. Only valid for type gp3"
  type        = number
  default     = null
}

variable "type" {
  description = "Type of volume"
  type        = string
}

variable "tags" {
  description = "Mapping of tags to assign to resources"
  type        = map(string)
  default     = {}
}
