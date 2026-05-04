# 🚀 Terraform AWS Infrastructure

Plantilla de Terraform para desplegar infraestructura básica en AWS con una EC2 pública lista para usar.

---

## Arquitectura
Internet
│
▼
Internet Gateway
│
▼
VPC (10.0.0.0/16)
│
▼
Subnet Pública (10.0.1.0/24)
│
▼
EC2 t3.micro (IP pública)
│
Security Group → Puerto 80 abierto

---

## Recursos desplegados

| Recurso | Nombre | Descripción |
|---|---|---|
| VPC | `mi-vpc` | Red privada `10.0.0.0/16` |
| Internet Gateway | `mi-igw` | Salida a internet |
| Route Table | `mi-rt` | Enruta tráfico al IGW |
| Subnet | `mi-subnet` | Subred pública `10.0.1.0/24` |
| Security Group | `gs-ec2` | Permite tráfico HTTP (80) |
| EC2 Instance | `learn-terraform` | `t3.micro` con IP pública |

---

## Requisitos

- [Terraform](https://www.terraform.io/downloads) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configurado
- Credenciales AWS con permisos EC2/VPC
- Key pair `vockey` creado en AWS

---

## Uso

```bash
# 1. Inicializar Terraform
terraform init

# 2. Ver los cambios antes de aplicar
terraform plan

# 3. Desplegar la infraestructura
terraform apply

# 4. Destruir todo cuando acabes
terraform destroy
```

---

## Seguridad

Este repositorio usa `.gitignore` para evitar subir archivos sensibles:
.terraform/
terraform.tfstate
terraform.tfstate.backup
*.tfvars

---

## Región

`us-east-1` — Norte de Virginia