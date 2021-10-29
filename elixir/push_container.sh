podman build -t try.nvim:stable-elixir --build-arg TAG=base-stable .
podman build -t try.nvim:nightly-elixir .

podman push try.nvim:stable-elixir quay.io/nvim-lsp/try.nvim:stable-elixir
podman push try.nvim:nightly-elixir quay.io/nvim-lsp/try.nvim:nightly-elixir
