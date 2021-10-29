podman build -t try.nvim:stable-lua --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-lua .

podman push try.nvim:stable-lua quay.io/nvim-lsp/try.nvim:stable-lua
podman push try.nvim:nightly-lua quay.io/nvim-lsp/try.nvim:nightly-lua
