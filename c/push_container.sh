podman build -t try.nvim:stable-c .
podman build -t try.nvim:nightly-c --build-arg VERSION=base-nightly .

podman push try.nvim:stable-c quay.io/nvim-lsp/try.nvim:stable-c
podman push try.nvim:nightly-c quay.io/nvim-lsp/try.nvim:nightly-c
