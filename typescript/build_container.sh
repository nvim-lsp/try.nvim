podman build -t try.nvim:stable-typescript .
podman build -t try.nvim:nightly-typescript --build-arg VERSION=base-nightly .
