terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.3.0"
    }
  }
  required_version = ">= 0.13"
}
provider "proxmox" {
  pm_api_url = "https://proxmox.foulkes.cloud:8006/api2/json"
  # api token id is in the form of: <username>@pam!<tokenId>
  pm_api_token_id = "terraform@pam!deploy_token"
  # this is the full secret wrapped in quotes. don't worry, I've already deleted this from my proxmox cluster by the time you read this post
  pm_api_token_secret = "07445f76-69c4-4a30-8f4d-7a653d826076"
  pm_tls_insecure     = true
  pm_debug            = true
}