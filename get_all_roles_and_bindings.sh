#!/usr/bin/env sh
echo "Exporting all roles"
kubectl get roles --all-namespaces -o json > roles.json
echo "Exporting all clusterroles"
kubectl get clusterroles -o json > clusterroles.json
echo "Exporting all rolebindings"
kubectl get rolebindings --all-namespaces -o json > rolebindings.json
echo "Exporting all clusterrolesbindings"
kubectl get clusterrolebindings -o json > clusterrolebindings.json
echo "Exporting all pods"
kubectl get pods --all-namespaces -o json > pods.json
echo "Running all analysis"
python3 ExtensiveRoleCheck.py --clusterRole clusterroles.json  --role roles.json --rolebindings rolebindings.json --clusterrolebindings clusterrolebindings.json --pods pods.json
