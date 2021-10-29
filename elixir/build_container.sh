podman build -t try.nvim:stable-elixir .
podman build -t try.nvim:nightly-elixir --build-arg VERSION=base-nightly .
