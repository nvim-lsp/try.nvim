podman build -t try.nvim:stable-python .
podman build -t try.nvim:nightly-python --build-arg VERSION=base-nightly .
