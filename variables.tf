variable "instance_count" {
  description = "Número de instâncias que serão provisionadas"
  type        = string
  default     = 1
}

variable "name" {
  description = "Nome da instância"
  type        = string
}

variable "ami" {
  description = "ID da AMI usada para provisionar a instância"
  type        = string
}

variable "instance_type" {
  description = "Tipo (classe) da instância"
  type        = string
}

variable "user_data" {
  description = "User data utilizado ao provisionar a instância"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Nome do Key Pair a ser usado para a instância"
  type        = string
  default     = ""
}

variable "iam_instance_profile" {
  description = "Instance Profile do IAM vinculado à instância"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "ID da subnet onde a instância será provisionada"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "Lista com IDs das subnets onde a instância será provisionada"
  type        = list(string)
  default     = null
}

variable "private_ip" {
  description = "IP privado da instância na VPC"
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "Vincula um IP público à instância"
  type        = bool
  default     = false
}

variable "vpc_security_group_ids" {
  description = "Lista com IDs dos security groups que serão vinculados à instância"
  type        = list(string)
  default     = null
}

variable "monitoring" {
  description = "Controla se a instância terá monitoramento detalhado"
  type        = bool
  default     = false
}

variable "disable_api_termination" {
  description = "Controla a proteção de destruição (terminate) da instância"
  type        = bool
  default     = false
}

variable "source_dest_check" {
  description = "Controla se o tráfego é roteado para a instância quando o endereço de destino não é o mesmo da instância"
  type        = bool
  default     = true
}

variable "cpu_credits" {
  description = "Opção de créditos de CPU da instância (\"unlimited\" ou \"standard\")"
  type        = string
  default     = "standard"
}

variable "ebs_optimized" {
  description = "Controla se a instância será provisionada como EBS-optimized"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Map de tags da instância e dos volumes"
  type        = map(string)
  default     = {}
}
