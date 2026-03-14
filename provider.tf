terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project     = "upgradlabs-1749732690621"
  region      = "us-central1"
  credentials = file("/home/jn_54ef33ac_3ea6_476d_adc9_918d7/sa.json")
}

