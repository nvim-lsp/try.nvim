FROM fedora:34

# Common dependencies
RUN dnf -y update && \
    dnf -y install git \
      ninja-build \
      libtool \
      autoconf \
      automake \
      cmake \
      gcc \
      gcc-c++ \
      make \
      pkgconfig \
      unzip \
      patch \
      gettext \
      curl && \
    dnf clean all

# Build neovim (and use it as an example codebase
RUN mkdir examples && cd examples && git clone https://github.com/neovim/neovim.git

RUN cd /examples/neovim && make -j install

# Copy the defaults.nvim init.lua
COPY ./init.lua /root/.config/nvim/init.lua

# Install extras
RUN dnf -y update && \
    dnf -y install ripgrep ctags fd-find && \
    dnf clean all

# Install clangd
RUN dnf -y update && \
    dnf -y install clang-tools-extra && \
    dnf clean all

# Add nodejs dependency for servers
RUN dnf -y update && \
    dnf -y install nodejs && \
    dnf clean all

# Install typescript language server and pyright
RUN npm i -g typescript

# Add nodejs dependency for coc
RUN dnf -y update && \
    dnf -y install yarnpkg  && \
    dnf clean all

# Install the defaults.nvim dependencies, INSTALL env var is a hack
RUN INSTALL=1 nvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Download example codebases for TypeScript, Python, and Rust (neovim covers C and lua)
RUN cd /examples && \
    git clone https://github.com/typescript-language-server/typescript-language-server.git && \
    git clone https://github.com/python-poetry/poetry.git && \
    git clone https://github.com/BurntSushi/ripgrep.git

WORKDIR /examples

ENTRYPOINT /bin/bash
