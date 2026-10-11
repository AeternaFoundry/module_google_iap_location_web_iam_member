resource "google_iap_location_web_iam_member" "iap_location_web_iam_members" {
  for_each = var.iap_location_web_iam_members

  location = each.value.location
  member   = each.value.member
  role     = each.value.role
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

