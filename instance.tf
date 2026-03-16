data "terraform_remote_state" "network_details" {
  backend = "gcs"

  config = {
    bucket  = "anurag0503"
    prefix  = "networking"
  }
}

resource "google_compute_instance" "my_vm" {
  name         = "anurag-instance"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20260310"
    }
  }

  network_interface {
    network    = data.terraform_remote_state.network_details.outputs.network_name
    subnetwork = data.terraform_remote_state.network_details.outputs.subnetwork_name
    access_config {}
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/vmkey.pub")}"
  }

  tags = ["anurag-instance"]
}
