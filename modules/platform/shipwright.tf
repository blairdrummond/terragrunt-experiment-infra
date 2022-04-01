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

  depends_on = [
    kubernetes_namespace.shipwright_build,
    kubernetes_namespace.web_system
  ]
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

  depends_on = [kubernetes_namespace.shipwright_build]
}

resource "kubernetes_secret" "shipwright_github_token" {
  metadata {
    name = "github-token"
    namespace = "shipwright-build"

    annotations = {
      "build.shipwright.io/referenced.secret" = "true"
    }
  }

  data = {
    username = var.github_username
    password = var.github_deploy_token
  }

  type = "kubernetes.io/basic-auth"

  depends_on = [kubernetes_namespace.shipwright_build]
}
