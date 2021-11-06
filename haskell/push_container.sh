podman build -t try.nvim:stable-python --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-python .

podman push try.nvim:stable-python quay.io/nvim-lsp/try.nvim:stable-python
podman push try.nvim:nightly-python quay.io/nvim-lsp/try.nvim:nightly-python
