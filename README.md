# csc468cloud

# Created a ubuntu experiment on cloudlab
git clone <This Repository>
ssh to experiment
  cd CSC468Cloud
  # Need to install Docker
  bash install_docker.sh
  # Need to install Kubernetes
  bash install_kubernetes.sh
  # Need to disable swap!! or Kubernetes will not run!
  sudo swapoff -a
  # initialize the Kube
  sudo bash kube_manager.sh
  # run the launch network 
  bash launch_network.sh
  
  
