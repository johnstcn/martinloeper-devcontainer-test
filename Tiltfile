# -*- mode: Python -*-

load('ext://k8s_attach', 'k8s_attach')

allow_k8s_contexts('default')

# Get environment variables
registry_host = os.getenv("NESTO_USER_CONTAINER_REGISTRY_HOST")
registry_name = os.getenv("NESTO_USER_CONTAINER_REGISTRY_NAME")

# Set the default registry
default_registry(registry_host + "/" + registry_name)

local_resource(
  'go-compile',
  './scripts/n-go-build',
  deps=['./internal', './cmd'],
  labels="server"
)

custom_build(
  'go-test',
  './scripts/docker-build.sh $EXPECTED_REF',
  deps=['.'],
  skips_local_docker=True,
  ignore=['./internal', './cmd'],
  entrypoint=['/app/helpers/start.sh', '/app/build/backend'],
  live_update=[
    sync('./build', '/app/build'),
    run('/app/helpers/restart.sh')
  ]
)

k8s_yaml('infra/deployment.yaml')