podman build -t try.nvim:stable-python --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-python .
