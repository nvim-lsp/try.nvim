ARG TAG=base-stable
FROM try.nvim:$TAG

# To support kickstart.nvim
RUN apk --no-cache add \
    ctags

# Add nodejs dependency for servers
RUN apk --no-cache add \
    git \
    nodejs \
    npm

# Install typescript and yarn
RUN npm i -g typescript yarn

# Copy the kickstart.nvim init.lua
COPY ./init.lua /root/.config/nvim/init.lua

# Install the kickstart.nvim dependencies, INSTALL env var is a hack
RUN INSTALL=1 nvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync

# Install clangd
RUN apk --no-cache add \
    clang-extra-tools

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Download example codebases for TypeScript, Python, and Rust (neovim covers C and lua)
RUN mkdir examples && \
    cd /examples && \
    git clone https://github.com/typescript-language-server/typescript-language-server.git && \
    git clone https://github.com/python-poetry/poetry.git && \
    git clone https://github.com/neovim/neovim.git && \
    git clone https://github.com/BurntSushi/ripgrep.git

WORKDIR /examples

ENTRYPOINT /bin/sh
