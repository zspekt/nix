{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    minikube
    kubectl
    k9s
    kubernetes-helm
    popeye
    kube-hunter
    kubespy
    kubesec
    kubeval
    kubectx
    kubetail
    kubescape
    kubefetch
    kubeaudit
    kube-bench
  ];
}
