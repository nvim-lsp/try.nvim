ARG TAG=base-nightly
FROM quay.io/nvim-lsp/try.nvim:${TAG}

# To support kickstart.nvim
RUN apk --no-cache add \
    fd  \
    ctags \
    ripgrep \
    git

# Copy the kickstart.nvim init.lua
COPY ./init.lua /root/.config/nvim/init.lua

# Install the kickstart.nvim dependencies, INSTALL env var is a hack
RUN INSTALL=1 nvim --headless +'autocmd User PackerComplete qall' +PackerSync

# Add clangd extras
RUN apk --no-cache add \
    clang-extra-tools

# Download example c codebase
RUN apk --no-cache add \
    autoconf \
    automake \
    build-base \
    cmake \
    coreutils \
    curl \
    gettext-tiny-dev \
    git \
    libtool \
    pkgconf \
    unzip

# Build neovim (and use it as an example codebase
RUN git clone https://github.com/neovim/neovim.git

RUN cd neovim && make

WORKDIR /neovim
