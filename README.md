# 🏗️ Terraform Templates

Colección de plantillas de Terraform para desplegar infraestructura en AWS de forma rápida y reutilizable.

---

## 📁 Estructura del repositorio
terraform-templates/
│
├── vpc/                  # VPC con subnets y routing
├── ec2/                  # Instancias EC2 con IP pública
├── security-groups/      # Security groups reutilizables
└── ...

---

## ☁️ Proveedor

- **Cloud:** AWS
- **Región por defecto:** `us-east-1`

---

## ⚙️ Requisitos

- [Terraform](https://www.terraform.io/downloads) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configurado
- Credenciales AWS activas

---

## 🚀 Cómo usar una plantilla

```bash
# 1. Clona el repositorio
git clone https://github.com/franefun/terraform-templates.git
cd terraform-templates/<plantilla>

# 2. Inicializa Terraform
terraform init

# 3. Revisa los cambios
terraform plan

# 4. Despliega
terraform apply

# 5. Destruye cuando acabes
terraform destroy
```

---

## 👤 Autor

**Fran Ferrer** — [@franefun](https://github.com/franefun)