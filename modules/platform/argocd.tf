resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "3.26.8"

  timeout = 600
  cleanup_on_fail = true
  force_update    = true
  namespace       = "argocd"

  depends_on = [kubernetes_namespace.argocd]

  values = [<<EOF
server:
  config:
    kustomize.buildOptions: "--load-restrictor LoadRestrictionsNone --enable-helm"
EOF
  ]
}

resource "helm_release" "argocd_applicationset" {
  name       = "argocd-applicationset"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-applicationset"
  version    = "1.6.0"

  timeout = 600
  cleanup_on_fail = true
  force_update    = true
  namespace       = "argocd"

  depends_on = [helm_release.argocd]
}


resource "kubectl_manifest" "argocd_projects" {
  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: projects
  namespace: argocd
spec:
  project: default
  destination:
    namespace: argocd
    server: https://kubernetes.default.svc
  source:
    repoURL: https://github.com/${var.github_username}/${var.github_repo}.git
    targetRevision: main
    path: projects
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
YAML

  depends_on = [helm_release.argocd]
}


resource "kubernetes_secret" "argocd_manifests_repo_key" {
  metadata {
    name = "manifests-repo-key"
    namespace = "argocd"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    type = "git"
    url = "https://github.com/blairdrummond/terragrunt-experiment-manifests.git"
    username = var.github_username
    password = var.github_deploy_token
  }
}
