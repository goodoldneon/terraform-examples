resource "aws_iam_user" "foo" {
  name = "foo"
}

resource "aws_iam_group" "admins" {
  name = "admins"
}

resource "aws_iam_group_membership" "admins" {
  name  = "admins"
  group = "${aws_iam_group.admins.name}"

  users = [
    "foo",
  ]
}
