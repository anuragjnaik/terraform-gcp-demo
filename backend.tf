terraform {
  backend "gcs" {
    bucket      = "anurag0503"
    credentials = "/home/jn_54ef33ac_3ea6_476d_adc9_918d7/sa.json"
    prefix      = "vm"
  }
}

