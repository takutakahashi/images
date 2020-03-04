FROM google/cloud-sdk:alpine

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.16.1/bin/linux/amd64/kubectl > /bin/kubectl \
 && chmod +x /bin/kubectl
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash \
 && mv kustomize /bin/
