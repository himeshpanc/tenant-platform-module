# Generic "tenant platform" module (stand-in). Its git TAG is the platform version
# the fleet promotes across tenants. Kept minimal — the tag is what matters; the
# fleet's per-tenant tofu uses the tag as its version input.
variable "tenant" { type = string }
output "platform_version" { value = "tenant-platform-module" }
