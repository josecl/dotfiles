


alias kubectl="kubecolor"


alias k=kubecolor
#source <(kubectl completion zsh)
# make completion work with kubecolor
compdef kubecolor=kubectl
compdef k=kubectl


# Imprime el contexto actual en Kubernetes
function kcontext()
{
  if [[ "$PWD"  =~ kubernetes ]]; then
       echo "$(kubens)\u2388 $(kubectl config current-context)"
  fi
}

# Cambia o retorna el namespace
function kubens()
{
  if [ -z "$1" ]
    then
      kubectl config view --minify -o jsonpath='{..namespace}'
    else
      kubectl config set-context --current --namespace="$1"
    fi
}

# Cambia o retorna el contexto
function kubectx()
{
  if [ -z "$1" ]
    then
      kubectl config get-contexts
    else
      kubectl config use-context "$1"
    fi
}
