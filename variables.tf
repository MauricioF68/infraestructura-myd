variable "project_name" {
  description = "El nombre del proyecto, usado para las etiquetas (tags)."
  type        = string
  default     = "myd"
}

variable "db_password" {
  description = "La contraseña para el usuario maestro de la base de datos."
  type        = string
  sensitive   = true 
}