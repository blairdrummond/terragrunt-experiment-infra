resource "kubernetes_namespace" "shipwright_build" {
  metadata {
    name = "shipwright-build"
  }
}


resource "kubernetes_secret" "docker_registry_read" {
  for_each = toset([
    "shipwright-build",
    "web-system"
  ])

  metadata {
    name = "image-pull-secret"
    namespace = each.key
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.registry_server}" = {
          auth = "${base64encode("${var.registry_username}:${var.registry_read_token}")}"
        }
      }
    })
  }

  type = "kubernetes.io/dockerconfigjson"
}


resource "kubernetes_secret" "docker_registry_write" {
  metadata {
    name = "registry-write"
    namespace = "shipwright-build"
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.registry_server}" = {
          auth = "${base64encode("${var.registry_username}:${var.registry_write_token}")}"
        }
      }
    })
  }

  type = "kubernetes.io/dockerconfigjson"
}
