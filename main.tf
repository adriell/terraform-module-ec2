# ----------------------------------------------------------------------------------------------------------------------
# EC2
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "main" {
  count = var.instance_count

  ami                  = var.ami
  instance_type        = var.instance_type
  user_data            = var.user_data
  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile

  subnet_id = element(distinct(compact(concat(list(var.subnet_id), var.subnet_ids))), count.index)

  private_ip                  = var.private_ip
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.vpc_security_group_ids

  monitoring              = var.monitoring
  disable_api_termination = var.disable_api_termination
  source_dest_check       = var.source_dest_check

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  ebs_optimized     = var.ebs_optimized

  tags = merge(
    map("Name", "${var.instance_count > 1 ? format("%s-%d", var.name, count.index + 1) : var.name}"),
    var.tags
  )

  volume_tags = merge(
    map("Name", "${var.instance_count > 1 ? format("%s-%d", var.name, count.index + 1) : var.name}"),
    var.tags
  )
}

# ----------------------------------------------------------------------------------------------------------------------
# IAM
# ----------------------------------------------------------------------------------------------------------------------


resource "aws_iam_role" "default" {
  count = var.iam_instance_profile != "" ? 0 : 1

  assume_role_policy = data.aws_iam_policy_document.allow_ec2_to_assume_role.json
}

data "aws_iam_policy_document" "allow_ec2_to_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}