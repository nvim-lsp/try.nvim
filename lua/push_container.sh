podman build -t try.nvim:stable-lua .
podman build -t try.nvim:nightly-lua --build-arg VERSION=base-nightly .

podman push try.nvim:stable-lua quay.io/nvim-lsp/try.nvim:stable-lua
podman push try.nvim:nightly-lua quay.io/nvim-lsp/try.nvim:nightly-lua
