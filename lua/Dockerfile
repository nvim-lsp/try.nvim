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

# Install sumneko
RUN apk --no-cache add \
    git \
    build-base \
    ninja \
    bash

RUN mkdir -p /root/.local/bin && \
    cd /root/.local/bin &&  \
    git clone --recursive https://github.com/sumneko/lua-language-server && \
    cd lua-language-server/3rd/luamake && \
    ./compile/install.sh && \
    cd ../.. && \
    ./3rd/luamake/luamake rebuild

# example lua codebase
RUN git clone https://github.com/neovim/neovim.git

WORKDIR /neovim
