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
