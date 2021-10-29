podman build -t try.nvim:base-stable --build-arg .
podman build -t try.nvim:base-nightly --build-arg VERSION=nightly .
