podman build -t try.nvim:stable-elixir .
podman build -t try.nvim:nightly-elixir --build-arg VERSION=base-nightly .

podman push try.nvim:stable-elixir quay.io/nvim-lsp/try.nvim:stable-elixir
podman push try.nvim:nightly-elixir quay.io/nvim-lsp/try.nvim:nightly-elixir
