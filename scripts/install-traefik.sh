helm repo add traefik https://helm.traefik.io/traefik
helm repo update

helm install -n kube-system traefik traefik/traefik  -f traefik-values.yaml

kubectl apply -f ingress-traefik.yaml