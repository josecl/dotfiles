export DESA=$HOME/desa





# SEM
export PATH=$HOME/desa/sem/cli:$PATH


function kpsql()
{
  if [[ -z "$1" ]]; then 
    echo "Uso:"
    echo "    kpsql <microservicio>"
    echo "    Ejemplo: kpsql tramitesgenerales"
  else
    kubectl run "psql-$1" --rm -it --image postgres:12 --env PGPASSWORD=$(kubectl get secret $1 -o jsonpath="{.data.DB_PASSWORD}" | base64 -d) -- psql -h $(kubectl get configmap servicios -o jsonpath="{.data.DB_HOST}") -U $(kubectl get configmap $1 -o jsonpath="{.data.DB_USERNAME}") $(kubectl get configmap $1 -o jsonpath="{.data.DB_DATABASE}")
  fi
}

