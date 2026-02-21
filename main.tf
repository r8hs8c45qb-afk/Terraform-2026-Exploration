resource "local_file" "post_linkedin" {
  content  = "Proyecto de IaC listo. Analizando Terraform vs OpenTofu vs Pulumi."
  filename = "${path.module}/resultado.txt"
}

output "mensaje_exito" {
  value = "¡Archivo creado con éxito! Ya puedes sacar la captura para tu post."
}
