# -*- mode: Python -*-

load('ext://k8s_attach', 'k8s_attach')
load('ext://uibutton', 'cmd_button', 'text_input', 'location')

allow_k8s_contexts('default')

# Get environment variables
registry_host = os.getenv("NESTO_USER_CONTAINER_REGISTRY_HOST")
registry_name = os.getenv("NESTO_USER_CONTAINER_REGISTRY_NAME")

# Set the default registry
default_registry(registry_host + "/" + registry_name)

local_resource(
  'go-compile',
  './scripts/n-go-build debug',
  deps=['./internal', './cmd'],
  labels="backend"
)

custom_build(
  'go-test',
  './scripts/docker-build.sh $EXPECTED_REF',
  deps=['.'],
  skips_local_docker=True,
  ignore=['./internal', './cmd', 'Dockerfile'],
  entrypoint=['/app/helpers/start.sh', "/root/go/bin/dlv", "exec", "/app/build/backend", "--headless", "--listen=:12345", "--accept-multiclient", "--continue"],
  live_update=[
    sync('./build', '/app/build'),
    run('/app/helpers/restart.sh')
  ]
)

k8s_yaml('infra/deployment.yaml')
k8s_yaml('infra/service.yaml')

k8s_resource(
  workload='myapp', 
  new_name="k8s-pod",
  labels="backend",
  port_forwards=[
    '8080',
    '12345'
  ],
)

# add a custom button to run a command in the backend pod
# pod_exec_script = '''
# set -eu
# POD_NAME="$(tilt get kubernetesdiscovery "k8s-pod" -ojsonpath='{.status.pods[0].name}')"

# if [ -z "$command" ]; then
#   echo "Errored: Please provide a command to run"
#   exit 1
# fi

# kubectl exec "$POD_NAME" -- $command
# '''
# cmd_button('podexec',
#   argv=['sh', '-c', pod_exec_script],
#   icon_name='bug_report',
#   text='Debug',
#   inputs=[
#     text_input('command'),
#   ],
#   resource='k8s-pod',
#   requires_confirmation=True,
# )