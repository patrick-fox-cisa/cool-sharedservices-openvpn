# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------
variable "client_dns_search_domain" {
  description = "The DNS search domain to be pushed to VPN clients."
  type        = string
}

variable "client_dns_server" {
  description = "The address of the DNS server to be pushed to the VPN clients."
  type        = string
}

variable "client_network" {
  description = "A string containing the network and netmask to assign client addresses. The server will take the first address. (e.g. \"10.240.0.0 255.255.255.0\")."
  type        = string
}

variable "private_networks" {
  description = "A list of strings, each of which contains a network and netmask defining a list of subnets that exist behind the VPN server (e.g. [\"10.224.0.0 255.240.0.0\", \"192.168.100.0 255.255.255.0\"]).  This will be concatenated with the list of S3 gateway endpoint routes and the result will be pushed to the clients."
  type        = list(string)
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the shared services account is to be created (e.g. \"us-east-1\")."
  type        = string
}

variable "cert_bucket_name" {
  default     = "cisa-cool-certificates"
  description = "The name of the AWS S3 bucket where certificates are stored."
  type        = string
}

variable "client_motd_url" {
  default     = "https://github.com/cisagov/cool-system/blob/develop/motd.md#welcome-to-cisas-cloud-oriented-operations-lab-cool"
  description = "A URL to the motd page.  This will be pushed to VPN clients as an environment variable."
  type        = string
}

variable "cool_domain" {
  default     = "cool.cyber.dhs.gov"
  description = "The domain where the COOL resources reside (e.g. \"cool.cyber.dhs.gov\")."
  type        = string
}

variable "crowdstrike_falcon_sensor_customer_id_key" {
  default     = "/cdm/falcon/customer_id"
  description = "The SSM Parameter Store key whose corresponding value contains the customer ID for CrowdStrike Falcon (e.g. /cdm/falcon/customer_id)."
  type        = string
}

variable "crowdstrike_falcon_sensor_tags_key" {
  default     = "/cdm/falcon/tags"
  description = "The SSM Parameter Store key whose corresponding value contains a comma-delimited list of tags that are to be applied to CrowdStrike Falcon (e.g. /cdm/falcon/tags)."
  type        = string
}

variable "nessus_hostname_key" {
  default     = "/cdm/nessus_hostname"
  description = "The SSM Parameter Store key whose corresponding value contains the hostname of the CDM Tenable Nessus server to which the Nessus Agent should link (e.g. /cdm/nessus/hostname)."
  type        = string
}

variable "nessus_key_key" {
  default     = "/cdm/nessus_key"
  description = "The SSM Parameter Store key whose corresponding value contains the secret key that the Nessus Agent should use when linking with the CDM Tenable Nessus server (e.g. /cdm/nessus/key)."
  type        = string
}

variable "nessus_port_key" {
  default     = "/cdm/nessus_port"
  description = "The SSM Parameter Store key whose corresponding value contains the port to which the Nessus Agent should connect when linking with the CDM Tenable Nessus server (e.g. /cdm/nessus/port)."
  type        = string
}

variable "provisionaccount_role_name" {
  default     = "ProvisionAccount"
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Shared Services account."
  type        = string
}

variable "provisionopenvpn_policy_description" {
  default     = "Allows provisioning of OpenVPN in the Shared Services account."
  description = "The description to associate with the IAM policy that allows provisioning of OpenVPN in the Shared Services account."
  type        = string
}

variable "provisionopenvpn_policy_name" {
  default     = "ProvisionOpenVPN"
  description = "The name to assign the IAM policy that allows provisioning of OpenVPN in the Shared Services account."
  type        = string
}

variable "root_disk_size" {
  default     = 8
  description = "The size of the OpenVPN instance's root disk in GiB."
  type        = number
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  type        = map(string)
}

variable "trusted_cidr_blocks_vpn" {
  default     = []
  description = "A list of the CIDR blocks that are allowed to access the VPN port on the VPN servers (e.g. [\"10.10.0.0/16\", \"10.11.0.0/16\"])."
  type        = list(string)
}
