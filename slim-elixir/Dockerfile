# Build neovim separately in the first stage
FROM alpine:latest

RUN apk --no-cache add \
    git \
    build-base \
    cmake \
    automake \
    autoconf \
    libtool \
    pkgconf \
    coreutils \
    curl \
    unzip \
    gettext-tiny-dev

# Build neovim (and use it as an example codebase
RUN git clone https://github.com/neovim/neovim.git

RUN cd neovim && make -j install && rm -rf /neovim

FROM alpine:latest  

# In the second stage, copy over neovim (only) and add the defaults.nvim configuration
# To run neovim, sorry no static linking
RUN apk --no-cache add \
    libgcc

COPY --from=0 /usr/local/lib/nvim /usr/local/lib/nvim
COPY --from=0 /usr/local/share/nvim /usr/local/share/nvim
COPY --from=0 /usr/local/bin/nvim /usr/local/bin/nvim

COPY ./init.lua /root/.config/nvim/init.lua

RUN apk --no-cache add  git

# Install the defaults.nvim dependencies, INSTALL env var is a hack
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

ENTRYPOINT nvim mix.exs
