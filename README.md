# 🚀 Terraform Infrastructure-as-Code Exploration (2026)

Este repositorio documenta mi viaje técnico en la automatización de infraestructura utilizando **Terraform**. El objetivo es demostrar la capacidad de gestionar ciclos de vida de recursos mediante código, bajo estándares de **DevSecOps**.

## 🛠️ Stack Tecnológico
* **IaC Engine:** Terraform v1.14.5 (Darwin ARM64)
* **Security Scanning:** tfsec (Aqua Security family)
* **Version Control:** Git & GitHub
* **CI/CD:** GitHub Actions (en progreso)

## 📋 Hitos del Proyecto
- [x] Configuración del entorno profesional en macOS.
- [x] Despliegue de recursos mediante Local Provider.
- [x] Implementación de políticas de exclusión de secretos (.gitignore).
- [x] Auditoría de seguridad de código estático (Sast) exitosa con **tfsec**.
- [ ] Migración de estado a AWS S3 / Azure Blob Storage.

## 🛡️ Seguridad (Shift-Left)
El código en este repositorio es auditado localmente para asegurar que no existan configuraciones inseguras antes de cada commit:
```bash
# Resultado de la última auditoría:
# Passed: 0, Failed: 0, Critical: 0
tfsec .
```

---
*Mantenido por Manuel González Baldomero*
