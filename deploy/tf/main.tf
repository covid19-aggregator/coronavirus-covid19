resource "digitalocean_kubernetes_cluster" "this" {
  name    = "zack-covid19"
  region  = "sfo2"
  version = "1.16.6-do.0"

  node_pool {
    name       = "main"
    node_count = 3
    size       = "s-4vcpu-8gb"
  }
}

resource "local_file" "kubeconfig" {
  filename = "kubeconfig"
  content = digitalocean_kubernetes_cluster.this.kube_config.0.raw_config
}

provider "helm" {
  kubernetes {
    host = digitalocean_kubernetes_cluster.this.endpoint
    token = digitalocean_kubernetes_cluster.this.kube_config[0].token
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate)
  }
}

data "helm_repository" "incubator" {
  name = "incubator"
  url  = "http://storage.googleapis.com/kubernetes-charts-incubator"
}

resource "helm_release" "spark" {
  name = "sparkoperator"
  chart = "sparkoperator"
  repository = data.helm_repository.incubator.metadata[0].name
}

