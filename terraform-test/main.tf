resource "local_file" "foo" {
  content  = "foo!"
  filename = "${var.filename}foo/foo.bar"
  file_permission = var.file_permission
}

resource "local_file" "example" {
  content  = "example!"
  filename = "${var.filename}example/example.bar"
  file_permission = var.file_permission
  directory_permission = var.directory_permission
}

resource "local_file" "pet" {
  filename = "${var.filename}pet/pet.bar"
  content = "My favorite pet is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}
