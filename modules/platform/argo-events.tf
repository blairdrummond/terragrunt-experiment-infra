resource "kubernetes_namespace" "argo_events" {
  metadata {
    name = "argo-events"
  }
}

# READ Token
resource "kubernetes_secret" "github_token" {
  metadata {
    name = "github-token"
    namespace = "default"
  }

  data = {
    "token" = var.github_token
  }
}

resource "random_string" "webhook_secret" {
  length           = 32
  special          = false
}

# READ Token
resource "kubernetes_secret" "github_webhook_secret" {
  metadata {
    name = "github-webhook-secret"
    namespace = "default"
  }

  data = {
    "secret" = random_string.webhook_secret.result
  }
}
