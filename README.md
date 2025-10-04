
# Infraestructura como Código para el Proyecto MYD

Este repositorio contiene el código de **Terraform** y **Ansible** para desplegar la infraestructura en AWS del proyecto de cotizaciones MYD. El objetivo es crear una arquitectura segura, escalable y de alta disponibilidad, gestionada completamente como código.

-----

## 📋 Requisitos Previos

Antes de comenzar, asegúrate de tener instaladas y configuradas las siguientes herramientas en tu máquina local:

  - [ ] Una **cuenta de AWS** con permisos para crear recursos.
  - [ ] **AWS CLI v2** (Interfaz de Línea de Comandos de AWS).
      - *Instrucciones de instalación:* [Documentación Oficial de AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
  - [ ] **Terraform**
      - *Instrucciones de instalación:* [Documentación Oficial de Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)



## ⚙️ Configuración Inicial

Para que Terraform pueda autenticarse con tu cuenta de AWS, es necesario configurar tus credenciales de acceso.

### 1\. Crear Claves de Acceso en AWS

Si aún no tienes un par de claves de acceso (Access Key ID y Secret Access Key), puedes generarlas siguiendo la guía oficial:

  - *Guía:* [Documentación de AWS IAM](https://www.google.com/search?q=https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html%23using_create-access-key)



### 2\. Configurar la AWS CLI

Abre una terminal y ejecuta el siguiente comando. La herramienta te pedirá las credenciales que acabas de crear.

```bash
aws configure
```

Rellena los datos de la siguiente manera:

  - **AWS Access Key ID:** `[Pega tu Access Key ID]`
  - **AWS Secret Access Key:** `[Pega tu Secret Access Key]`
  - **Default region name:** `us-east-1`
  - **Default output format:** `[Presiona Enter]`

Terraform usará estas credenciales automáticamente para crear la infraestructura.

-----

## 🚀 Despliegue de la Infraestructura

Sigue estos pasos para desplegar la infraestructura definida en el código.

**1. Clonar el Repositorio:**

```bash
git clone https://github.com/tu-usuario/infraestructura-myd.git
```

**2. Navegar al Directorio:**

```bash
cd infraestructura-myd
```

**3. Inicializar Terraform:**
Este comando descarga el proveedor de AWS necesario para que Terraform funcione.

```bash
terraform init
```

**4. Revisar el Plan de Ejecución (Recomendado):**
Este comando te mostrará un resumen de los recursos que se van a crear, sin aplicar ningún cambio. Es un paso de seguridad para verificar que todo es correcto.

```bash
terraform plan
```

**5. Aplicar la Configuración:**
Este comando construirá la infraestructura en tu cuenta de AWS. Te pedirá una confirmación final.

```bash
terraform apply
```

Cuando te lo solicite, escribe `yes` y presiona Enter.

-----

## 🏗️ Recursos Creados (Hasta Ahora)

Después de ejecutar `terraform apply`, los siguientes recursos base de la red estarán creados en tu cuenta de AWS:

  - **1 VPC (Virtual Private Cloud):** La red aislada principal para el proyecto.
  - **4 Subredes:**
      - 2 Subredes Públicas (en 2 Zonas de Disponibilidad distintas para alta disponibilidad).
      - 2 Subredes Privadas (en las mismas 2 Zonas de Disponibilidad).
  

-----

## 🧹 Limpieza

Para **destruir toda la infraestructura** creada por Terraform y evitar costos innecesarios, ejecuta el siguiente comando:

```bash
terraform destroy
```

Se te pedirá una confirmación final. Escribe `yes` y presiona Enter.