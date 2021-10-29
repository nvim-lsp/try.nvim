podman build -t try.nvim:stable-typescript --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-typescript .

podman push try.nvim:stable-typescript quay.io/nvim-lsp/try.nvim:stable-typescript
podman push try.nvim:nightly-typescript quay.io/nvim-lsp/try.nvim:nightly-typescript
