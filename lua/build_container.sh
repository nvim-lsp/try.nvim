podman build -t try.nvim:stable-lua --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-lua .
