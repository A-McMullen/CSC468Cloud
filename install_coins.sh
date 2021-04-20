cd
kubectl create deployment registry --image=registry
kubectl expose deploy/registry --port=5000 --type=NodePort
NODEPORT=$(kubectl get svc/registry -o json | jq '.spec.ports[0].nodePort')
REGISTRY=127.0.0.1:$NODEPORT
docker pull busybox
docker tag busybox $REGISTRY/busybox
docker push $REGISTRY/busybox
curl $REGISTRY/v2/_catalog
git clone https://github.com/jpetazzo/container.training
cd ~/container.training/stacks
echo $NODEPORT

# At this point, modify the dockercoins.yml file and replace 5000 with the port value of $NODEPORT. You can run echo $NODEPORT to find out this value.

export TAG=v0.1
docker-compose -f dockercoins.yml build
docker-compose -f dockercoins.yml push
kubectl create deployment redis --image=redis
for SERVICE in hasher rng webui worker; do kubectl create deployment $SERVICE --image=$REGISTRY/$SERVICE:$TAG; done
kubectl expose deployment redis --port 6379
kubectl expose deployment rng --port 80
kubectl expose deployment hasher --port 80
kubectl expose deploy/webui --type=NodePort --port=80
kubectl get svc


 # Setup Kubernetes Dashboard

kubectl apply -f ~/container.training/k8s/dashboard-insecure.yaml
kubectl apply -f ~/container.training/k8s/socat.yaml
kubectl get svc

