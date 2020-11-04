cp custom/golangchaos_types.go chaos-mesh/api/v1alpha1

make yaml

kustomize build config/crd > manifests/crd.yaml

make generate

mkdir -p chaosmesh/controllers/golangchaos

cp custom/types.go chaosmesh/controllers/golangchaos/

protoc --go_out=plugins=grpc:. ./chaosdaemon.proto

cp custom/golang_error.go chaosmesh/pkg/chaosdaemon/

set DOCKER_REGISTRY harbor.shopeemobile.com

---------------
kubectl apply -f manifests/
kubectl get crd golangchaos.chaos-mesh.org


---------------
```yaml
apiVersion: chaos-mesh.org/v1alpha1
kind: GolangChaos
metadata:
    name: golang-error-example
    namespace: chaos-testing
spec:
    action: sql-query-error
    mode: one
    duration: "30s"
    selector:
        labelSelectors:
            app: httpapp
    scheduler:
        cron: "@every 2m"
```
