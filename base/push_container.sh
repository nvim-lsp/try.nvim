podman build -t try.nvim:base-stable --build-arg VERSION=stable .
podman build -t try.nvim:base-nightly --build-arg VERSION=nightly .

podman push try.nvim:base-stable quay.io/nvim-lsp/try.nvim:base-stable
podman push try.nvim:base-nightly quay.io/nvim-lsp/try.nvim:base-nightly
