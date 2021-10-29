podman build -t try.nvim:stable-rust --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-rust .

podman push try.nvim:stable-rust quay.io/nvim-lsp/try.nvim:stable-rust
podman push try.nvim:nightly-rust quay.io/nvim-lsp/try.nvim:nightly-rust
