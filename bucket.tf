resource "google_storage_bucket" "example" {
  name          = "anurag0503"
  location      = "US"
  force_destroy = true
}
