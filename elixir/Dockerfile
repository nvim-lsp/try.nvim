ARG REGISTRY
ARG REPO=try.nvim
ARG TAG=base-nightly
FROM ${REGISTRY}${REPO}:${TAG}

# To support kickstart.nvim
RUN apk --no-cache add \
    fd  \
    ctags \
    ripgrep \
    git

# Copy the kickstart.nvim init.lua
COPY ./init.lua /root/.config/nvim/init.lua

# Install the kickstart.nvim dependencies, INSTALL env var is a hack
RUN INSTALL=1 nvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync

RUN apk --no-cache add \
    curl \
    elixir

RUN curl -LO https://github.com/elixir-lsp/elixir-ls/releases/download/v0.8.1/elixir-ls-1.12.zip && \
    unzip elixir-ls-1.12.zip -d elixir-ls && \
    rm -rf elixir-ls-1.12.zip

RUN git clone https://github.com/phoenixframework/phoenix.git && \
    cd phoenix && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

WORKDIR /phoenix
