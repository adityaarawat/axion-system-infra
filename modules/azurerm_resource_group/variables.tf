# Resource groups are keyed by stable caller-defined identifiers for predictable for_each addresses.
variable "rgs" {
  description = "Resource groups to create, keyed by a stable local identifier."
  type = map(object({
    name     = string
    location = string
  }))
}
