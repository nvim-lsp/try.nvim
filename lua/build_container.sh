podman build -t try.nvim:stable-lua .
podman build -t try.nvim:nightly-lua --build-arg VERSION=base-nightly .
