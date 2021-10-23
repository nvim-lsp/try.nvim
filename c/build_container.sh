podman build -t try.nvim:stable-c .
podman build -t try.nvim:nightly-c --build-arg VERSION=base-nightly .
