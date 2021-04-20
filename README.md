# csc468cloud

# Created a ubuntu experiment on cloudlab
# Create a 3 node Experiment 
# On all three nodes
git clone --branch Kubernetes https://github.com/A-McMullen/CSC468Cloud.git
ssh to experiment
  cd CSC468Cloud
  # Need to install Docker
  bash install_docker.sh
  # Need to install Kubernetes
  bash install_kubernetes.sh
  # Need to disable swap!! or Kubernetes will not run!
  sudo swapoff -a
  # initialize the Kube
  # One Node 0
  sudo bash kube_manager.sh
  # One Node 1 & 2
  sudo bash kube_worker.sh
  # run the launch network 
  bash launch_network.sh
  # verify the nodes
  kubectl get nodes
  
