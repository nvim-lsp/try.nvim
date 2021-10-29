podman build -t try.nvim:stable-rust --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-rust .
