# k3d-traefik-argocd
K3D with Argocd using Traefik as a router



## /etc/hosts

add the `argocd.local` entry so you have a url to hit inside the K3D cluster. 

```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
255.255.255.255	broadcasthost
127.0.0.1	localhost argocd.local

::1             localhost

```


# Install Cluster and Tools

### 1. Install K3D 

Note: this disables the internal Traefik that is used by defalt

```bash
./install.sh
```

**Note**
This ingress is for HTTP but forwards onto the HTTPS


#### Configuration Used for Ingress

https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts 


# Test to see if Argocd is running


## Curl command 
```bash
curl -v -k https://argocd.local:8070 -H "host: argocd.local:8070" --resolve argocd.local:8070:127.0.0.1
```

### Curl expected output
```
<!doctype html><html lang="en"><head><meta charset="UTF-8"><title>Argo CD</title>
......
```

## Browser test.

https://argocd.local:8070


**Note on HTTP issue**

Chrome on Mac has an issue with the HTTP url, it will remove the port if you do not have a **?** on the URL.

[http://argocd.local:8070?](http://argocd.local:8070?)

### Expected output 

See the Octopus login pagge 

URL is now 
[https://argocd.local:8070/login?](https://argocd.local:8070/login?)

### Get Argocd Admin Password

```bash
./scripts/argocd-show-password.sh
```


# tear down cluster

```bash
./scripts/cluster-delete.sh
```