podman build -t try.nvim:stable-typescript .
podman build -t try.nvim:nightly-typescript --build-arg VERSION=base-nightly .

podman push try.nvim:stable-typescript quay.io/nvim-lsp/try.nvim:stable-typescript
podman push try.nvim:nightly-typescript quay.io/nvim-lsp/try.nvim:nightly-typescript
