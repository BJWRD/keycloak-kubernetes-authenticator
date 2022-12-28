# keycloak-kubernetes-authenticator
Keycloak Cluster deployed to Kubernetes

## Architecture
Enter Image

## How to Apply/Destroy
This section details the deployment and teardown of the keycloak-kubernetes-authenticator architecture. 

## Prerequisites
* Minikube installation - [steps](https://minikube.sigs.k8s.io/docs/start/)
* Virtualbox installation - [steps](https://www.virtualbox.org/wiki/Downloads) 
* Hyperkit installation - [steps](https://minikube.sigs.k8s.io/docs/drivers/hyperkit/)
* Git installation - [steps](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Deploying Keycloak-Cluster Locally

## Deployment steps - Manual Installation/Setup

###	1. Clone the keycloak-kubernetes-authenticator repo
     git clone https://github.com/BJWRD/keycloak-kubernetes-authenticator

### 2. Start the minikube instance within Hyperkit
     minikube start --driver=hyperkit

<img width="475" alt="image" src="https://user-images.githubusercontent.com/83971386/209128607-3da863f9-b5f7-47ab-909c-fee6409a3b55.png">

### 3. Enable Minikube Ingress addon
     helm install wordpress helm-wordpress-example/
     
### 4. Create the Keycloak Service and Deployment
     kubectl create -f service.yaml
     kubectl create -f deployment.yaml

### 5. Substitute the Minikube instance IP address within ingress.yaml file
     sed "s/KEYCLOAK_HOST/keycloak.$(minikube ip).nip.io/" 
     
### 6. Create the Keycloak Ingress service
     kubectl create -f ingress.yaml
     
## Deployment steps - Automated Installation/Setup

###	1. Clone the keycloak-kubernetes-authenticator repo
     git clone https://github.com/BJWRD/keycloak-kubernetes-authenticator
     
### 2. Change file permissions
     chmod 700 setup.sh

### 3. Execute the setup.sh script
     ./setup.sh
     
## Test Keycloak site accessibility
Now that the Kubernetes Keycloak-Cluster has been deployed, it's time to test to see whether we can now access the Keycloak Authentication system.

Firstly verify the Minikube Network settings -

    minikube ip
    minikube service list
    
<img width="384" alt="image" src="https://user-images.githubusercontent.com/83971386/209134617-0ccd31a5-4cca-4dda-bf62-f48c7412d5e6.png">

Once confirmed, enter the address within a browser (http://<IP>:<Port>) and you will then be presented with the Keycloak login screen -

Enter Image

## System Access and Usability 

### Teardown steps


    
### 2.  Delete the running minikube instance
     minikube delete
     
## List of tools/services used
* [Minikube](https://minikube.sigs.k8s.io/docs/)
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* [Hyperkit](https://minikube.sigs.k8s.io/docs/drivers/hyperkit/)
* [Keycloak](https://www.keycloak.org)

## Useful Links -
* https://www.keycloak.org/getting-started/getting-started-kube
