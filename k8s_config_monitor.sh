#Usage details


#Comprehensive shell script to monitor 10 common Kubernetes cluster configuration issues.

# This script will run in a loop, continually checking for issues and displaying relevant information to standard output.
# It can be stopped by pressing Ctrl+C. 
# The script includes checks for issues like RBAC misconfigurations, pod security policies, and others




#!/bin/bash

# Check if the script is running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script should be run as root for complete monitoring."
    exit 1
fi

# Function to check incorrect resource requests and limits
check_resource_limits() {
    echo "Checking resource requests and limits..."
    kubectl top nodes
    kubectl top pods --all-namespaces
    echo ""
}

# Function to check RBAC misconfiguration
check_rbac() {
    echo "Checking RBAC configuration..."
    kubectl get roles --all-namespaces
    kubectl get rolebindings --all-namespaces
    echo ""
}

# Function to check networking misconfigurations
check_networking() {
    echo "Checking network issues..."
    kubectl get pods --all-namespaces -o wide | grep -i 'not ready'
    kubectl get svc --all-namespaces
    echo ""
}

# Function to check cluster autoscaling
check_autoscaling() {
    echo "Checking autoscaling..."
    kubectl get hpa --all-namespaces
    kubectl get nodes
    echo ""
}

# Function to check pod security policies
check_security_policies() {
    echo "Checking pod security policies..."
    kubectl get podsecuritypolicies
    kubectl describe podsecuritypolicy
    echo ""
}

# Function to check storage configuration errors
check_storage() {
    echo "Checking storage configurations..."
    kubectl get pv
    kubectl get pvc --all-namespaces
    echo ""
}

# Function to check inconsistent environment configuration
check_environment() {
    echo "Checking for environment configuration discrepancies..."
    kubectl get configmap --all-namespaces
    kubectl get secrets --all-namespaces
    echo ""
}

# Function to check cluster upgrade failures
check_cluster_upgrade() {
    echo "Checking cluster upgrade status..."
    kubectl version
    kubectl get componentstatuses
    echo ""
}

# Function to check logging and monitoring gaps
check_logging_monitoring() {
    echo "Checking logging and monitoring..."
    kubectl get pods --all-namespaces | grep -i 'fluentd|prometheus'
    kubectl get namespaces
    echo ""
}

# Function to check improper namespace management
check_namespaces() {
    echo "Checking namespaces..."
    kubectl get namespaces
    kubectl get pods --all-namespaces
    echo ""
}

# Display instructions
echo "Kubernetes Cluster Health Monitoring Script"
echo "Press [CTRL+C] to stop the monitoring."
echo "-----------------------------------------"
echo ""

# Continuous monitoring loop
while true; do
    check_resource_limits
    check_rbac
    check_networking
    check_autoscaling
    check_security_policies
    check_storage
    check_environment
    check_cluster_upgrade
    check_logging_monitoring
    check_namespaces
    sleep 10
done
