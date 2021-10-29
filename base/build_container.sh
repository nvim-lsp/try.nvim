podman build -t try.nvim:base-stable --build-arg VERSION=stable .
podman build -t try.nvim:base-nightly --build-arg VERSION=nightly .
