variable "image_id" {
  description = "The name of the resource to be created"
  type        = string
  default     = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
    default = "t2.micro"
    description = "The type of instance to use" 
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "anil44"  # Change to your actual key pair name
  
} 

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"  # Change to your preferred AWS region
}
variable "instance_names" {
  description = "List of instance names"
  type        = list
  default     = ["db","frentend","backend","database",]  # List of instance names
}