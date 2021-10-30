podman build -t try.nvim:stable-fortran --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-fortran .

podman push try.nvim:stable-fortran quay.io/nvim-lsp/try.nvim:stable-fortran
podman push try.nvim:nightly-fortran quay.io/nvim-lsp/try.nvim:nightly-fortran
