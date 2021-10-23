podman build -t try.nvim:stable-rust .
podman build -t try.nvim:nightly-rust --build-arg VERSION=base-nightly .
