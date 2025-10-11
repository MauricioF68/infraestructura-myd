# --- GRUPO DE SEGURIDAD PARA EL ALB ---
resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg"
  description = "Permite trafico HTTPS hacia el ALB"
  vpc_id      = module.myd_vpc.vpc_id

  # Regla de Entrada (Inbound)
  ingress {
    description      = "HTTPS desde cualquier lugar"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # "0.0.0.0/0" significa "cualquier IP"
  }

  # Regla de Salida (Outbound) - Permitir que el ALB envíe tráfico a cualquier lugar
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}


# --- GRUPO DE SEGURIDAD PARA LOS SERVIDORES EC2 ---
# Este firewall es mucho más restrictivo. Solo permite conexiones
# que vengan desde nuestro propio ALB.
resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg"
  description = "Permite trafico HTTP solo desde el ALB"
  vpc_id      = module.myd_vpc.vpc_id

  # Regla de Entrada (Inbound)
  ingress {
    description     = "HTTP solo desde el ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    
    # el ID de otro Grupo de Seguridad (el del ALB).
    security_groups = [aws_security_group.alb.id]
  }

  # Regla de Salida (Outbound) - Permitir que los servidores salgan a internet
  # (para descargar paquetes, conectarse a APIs, etc.)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }
}