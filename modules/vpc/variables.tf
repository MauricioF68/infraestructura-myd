variable "project_name" {
  description = "El nombre del proyecto, usado para las etiquetas (tags)."
  type        = string
}

variable "region" {
  description = "La región de AWS donde se crearán los recursos."
  type        = string
}