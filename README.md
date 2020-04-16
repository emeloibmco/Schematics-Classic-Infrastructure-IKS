
# Desplegar Cluster de Kubernetes desde Terraform

_Esta guia es un paso a  paso del despliegue de un Cluster de Kubernetes en IBM Cloud desde CLI, utilizando terraform._

## Arquitectura

<img width="262" alt="iks" src="https://user-images.githubusercontent.com/60987042/79510157-7174ee80-8002-11ea-9548-e7f6d243f0ea.PNG">
---

## Comenzando 🚀

_Para iniciar con el despliegue es necesario que hagamos un pull de la imagen Docker provista por ibm en la cual se encuantran las diferentes plantillas y configuracion para el despliegue del cluster._

_El pull de esta imagen docker se puede hacer utilizando el siguiente comando:_

    
    docker pull ibmterraform/terraform-provider-ibm-docker
    
    
_Despues de haber hecho el pull de la imagen, debemos verificar que se a agregado correctamente la imagen y esta verificación se hace mediente el siguinete comando:_

    
    docker images
    

_Ahora debemos ingresar en esta imagen que acabamos de subir para desde ahi realizar el despliegue, Para ingresar a la imagen debemos ingresar el siguiente comando:_

    
    docker run -it ibmterraform/terraform-provider-ibm-docker:latest /bin/bash
    
    
## Despliegue 📦

_Apenas ingresemos a la imagen debe aparecer al inicio de la linea de comandos lo siguiente:_

    Bash-4.4#
    
_Ahora debemos clonar el repositorio de GitHub, y esto se hace mediante el siguiente comando:_

    git clone https://github.com/emeloibmco/Schematics-Classic-Infrastructure-IKS.git
    
_Al tener clonado el repositorio, debemos ingresar a este preyecto y lo hacemos mediante el siguiente comando:_

    cd Schematics-Classic-Infrastructure-IKS
 
## Ahora debemos modificar los diferentes archivos que encontramos aqui 🛠️


### Table of Contents
1. [Cluster](##cluster)
2. [Module Variables](##Module-Variables)
3. [Outputs](##Outputs) (optional)
4. [As a Module in a Larger Architecture](##As-a-Module-in-a-Larger-Architecture)

---
## Cluster

This module creates an IKS cluster, it will also optionall provision workers in multiple zones from a list. 

---
## Module Variables

Variable | Type | Description | Default
---------|------|-------------|--------
`ibmcloud_api_key` | String | IBM Cloud IAM API Key |
`resource_group` | String | Name of resource group to provision resources |
`ibm_region` | String | IBM Cloud region where all resources will be deployed | `us-south`
`public_vlan_ids` | List | List of public vlans. The first will be for the master, any additional will be for worker pools. This is optional if you use `private_only` |
`private_vlan_ids` | List | List of private vlans The first will be for the master, any additional will be for worker pools |
`zones` | List | List of cluster zones The first will be for the master, any additional will be for worker pools. The zones must be in te same order as te VLAN Ids |
`cluster_name` | String | Name of openshift cluster to be created | `classic-cluster`
`default_pool_size` | String | Default pool size for cluster | `1`
`hardware` | String | Hardware type for cluster, shared or dedicated | `shared`
`machine_type` | String | hardware type for cluster | `b2c.4x16`
`private_only` | Boolean | Provision cluster workers on private only | `false`
---

## Outputs

- `cluster_id` : Cluster ID, will await the worker pool zone attachments before outputting

---
## As a Module in a Larger Architecture

Using Default Variables

```
module classic_cluster {
    source            = "<path to your code>"
    resource_group_id = "<path to your code>"
    public_vlan_ids   = "<path to your code>" 
    private_vlan_ids  = "<path to your code>" 
    zones             = "<path to your code>" 
    cluster_name      = "<path to your code>" 
}
```

Using All Custom Variables

```
module classic_cluster {
    source            = "<path to your code>"
    resource_group_id = "<path to your code>"
    public_vlan_ids   = "<path to your code>" 
    private_vlan_ids  = "<path to your code>" 
    zones             = "<path to your code>" 
    cluster_name      = "<path to your code>" 
    kube_version      = "<path to your code>" 
    default_pool_size = "<path to your code>" 
    hardware          = "<path to your code>" 
    machine_type      = "<path to your code>" 
    private_only      = "<path to your code>" 
}
```
