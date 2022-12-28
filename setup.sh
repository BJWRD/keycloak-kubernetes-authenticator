#!/bin/bash

#Start Minikube instance 
minikube start --driver=hyperkit

Echo "Sleeping while starting up"
sleep 120


#Enable Minikube Ingress addon
minikube addons enable ingress

#Create the required Keycloak Service and Deployment
kubectl create -f Service.yaml

sleep 10

kubectl create -f Deployment.yaml

#Substitute Minikube IP within the Ingress.yaml file 
sed "s/KEYCLOAK_HOST/keycloak.$(minikube ip).nip.io/"

#Create the Keycloak Ingress service
kubectl create -f ingress.yaml

