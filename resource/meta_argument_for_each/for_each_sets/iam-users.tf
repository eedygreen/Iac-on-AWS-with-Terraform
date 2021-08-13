# Create 4 IAM users with for_each meta argument "sets"

# for_each with set of strings, each.key = each.value
resource "aws_iam_user" "power-users" {
    for_each = toset([ "Eedy", "Green", "Mend", "TJ" ])
    name = each.key
}