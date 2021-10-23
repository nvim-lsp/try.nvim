podman build -t try.nvim:stable-python .
podman build -t try.nvim:nightly-python --build-arg VERSION=base-nightly .

podman push try.nvim:stable-python quay.io/nvim-lsp/try.nvim:stable-python
podman push try.nvim:nightly-python quay.io/nvim-lsp/try.nvim:nightly-python
