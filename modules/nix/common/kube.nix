{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    minikube
    kubectl
    k9s
    kubernetes-helm
  ];
}
