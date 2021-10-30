podman build -t try.nvim:base-stable --build-arg VERSION=release-0.5 .
podman build -t try.nvim:base-nightly --build-arg VERSION=master .

podman push try.nvim:base-stable quay.io/nvim-lsp/try.nvim:base-stable
podman push try.nvim:base-nightly quay.io/nvim-lsp/try.nvim:base-nightly
