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

# Add a language server (pyright)
RUN apk --no-cache add \
    nodejs \
    npm

# Install typescript language server and pyright
RUN npm i -g typescript typescript-language-server pyright

# Download example codebases for TypeScript, Python, and Rust (neovim covers C and lua)
RUN git clone https://github.com/typescript-language-server/typescript-language-server.git && \
    cd typescript-language-server && \
    npm install

WORKDIR /typescript-language-server

ENTRYPOINT nvim src/cli.ts
