
# commented default value since you are specifiying in tfvars file, no harm in defining
# it here as well since it will over ride the values


variable "azs" {
  description = "availability zones"
  type        = list(string)
}

variable "cidr_block" {
  description = "cidr range"
  type        = string
}

variable "private_sub" {
  type = list(string)
}

variable "public_sub" {
  type = list(string)
}

variable "db_sub" {
  type = list(string)
}
