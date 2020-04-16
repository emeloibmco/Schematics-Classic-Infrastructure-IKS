
# Desplegar Cluster de Kubernetes desde Terraform

_Esta guia es un paso a  paso del despliegue de un Cluster de Kubernetes en IBM Cloud desde CLI, utilizando terraform._

### Table of Contents
1. [Cluster](##cluster)
2. [Module Variables](##Module-Variables)
3. [Outputs](##Outputs) (optional)
4. [As a Module in a Larger Architecture](##As-a-Module-in-a-Larger-Architecture)


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
 
## Ahora debemos modificar el archivo "variables.tf" 🛠️

_Para poder entrar a editar este archivo debemos ingresar el siguinete comando:_

    vi variables.tf
    
_Apenas ingresemos al archivo debemos precionar la tecla **i** del teclado, al hacer esto se nos habilitara la edición del archivo._

_Los campos que debemos modificar de este archivos son:_

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
    
    
_Para salir y guardar los cambios hechos en este documento de debe precionar primero la tecla **esc** y luego digitar **:wq!** y por ultimo dar enter._ 



## Despliegue del CLuster con terraform 🖇️

_Despues de haber modificado los archivos anteriores, debemos digitar el siguiente comando:_

    terraform init

_Apenas termine de ejecutarse el comando anterior, debemos digitar el siguiente comando:_

    terraform plan
    
_En el comando anterior se va a demorar un poco ya que esta contruyendo el plano para el despliegue. Al termiar de ejecutar este comando se debe digitar el siguiente:_

    terraform apply
    
_Al ejecutar el comando anterior, despues de unos segundos nos va a parecer una pregunta en la cual debemos contestar **yes**, y aca estamos dando la autorización de crear el cluster de OpenShift en IBM Cloud._



### Pre-requisitos 📋

_Para el correcto funcionameniento de este despliegue en IBM Cloud son necesarios los siguinetes programas:_

* _Docker:_

    ```
    sudo apt install docker-ce
    ```

* _Ansible:_
    ```
    pip install "ansible>=2.8.0"
    ```
_Ademas debemos crear desde la pagina de IBM Cloud los siguientes recursos:_

* 1 Api_key de IBM Cloud.
* 1 Api_key para infraestructura clasica.
* 1 Vlan publica.
* 1 Vlan privada.

## Autor ✒️

* **Jhoiner Smith Rojas González** -  - jhoinerrojas@ibm.com
_Equipo IBM Cloud Tech Sales Colombia._



