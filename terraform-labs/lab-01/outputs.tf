output "security_gropu_id" {
  value = aws_security_group.eedy_security_group.id
}

output "launch_template_id" {
  value = aws_launch_template.eedy_launch_template.id
}

output "asg_id" {
  value = aws_autoscaling_group.eedy_asg.id
}