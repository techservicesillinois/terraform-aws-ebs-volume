# ebs-volume

[![Build Status](https://drone.techservices.illinois.edu/api/badges/techservicesillinois/terraform-aws-ebs-volume/status.svg)](https://drone.techservices.illinois.edu/techservicesillinois/terraform-aws-ebs-volume)

Provides an Elastic Block Storage volume to make persistent block-level storage volumes available to EC2 instances.

Example Usage
-----------------

```hcl
module "volume" {
  source = "git@github.com:techservicesillinois/terraform-aws-ebs-volume"
  
  availability_zone = "us-east-2b"
  size = 50
  
  tags = {
    Environment  = "test"
    Name         = "ebs-example"
  }
}
```

Note that this module uses a Terraform `lifecycle` block with `prevent_destroy` set to *true*, because the consequence of an accidental `terraform destroy`  on an EBS volume is to wipe out any data stored there.

The Terraform documentation states:

* `prevent_destroy `(bool) - This flag provides extra protection against the destruction of a given resource.
When this flag is set to true, any plan that includes a destroy of this resource will return an error message.

Unfortunately, Terraform does not support interpolations in the `lifecycle` block, which means that the only way to intentionally destroy the affected resource is to do so in the AWS console.

Argument Reference
-----------------

The following arguments are supported:

* `availability_zone` - (Required) The AZ where the EBS volume will reside. **NOTE:** Unlike many other resources, EBS volumes are not tied to a specific Virtual Private Cloud (VPC), but EBS volumes *must* reside in the same AZ as the EC2 instance that is to mount the volume.

* `encrypted` - (Optional) Encrypt data on volume at rest. Default: true.

* `size` - (Optional) The size of the drive in GiBs.

* `tags` - (Optional) A mapping of tags to assign to the resource.


Attributes Reference
--------------------

The following attributes are exported:

* `arn` - The ARN of the EBS volume.

* `id` - The ID of the EBS volume.
