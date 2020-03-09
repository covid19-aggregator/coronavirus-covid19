resource "digitalocean_kubernetes_cluster" "this" {
  name    = "zack-covid19"
  region  = "sfo2"
  version = "1.16.6-do.0"

  node_pool {
    name       = "main"
    node_count = 3
    size       = "s-2vcpu-4gb"
  }
}

resource "local_file" "kubeconfig" {
  filename = "kubeconfig"
  content = digitalocean_kubernetes_cluster.this.kube_config.0.raw_config
}