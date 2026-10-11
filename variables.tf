variable "iap_location_web_iam_members" {
  description = <<EOT
Map of iap_location_web_iam_members, attributes below
Required:
    - location
    - member
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    location = string
    member   = string
    role     = string
    project  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

