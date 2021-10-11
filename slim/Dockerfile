
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

# To support defaults.nvim
RUN apk --no-cache add \
    fd  \
    ctags \
    ripgrep \
    git

# Copy the defaults.nvim init.lua
COPY ./init.lua /root/.config/nvim/init.lua

# Install the defaults.nvim dependencies, INSTALL env var is a hack
RUN INSTALL=1 nvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync

# Add a language server (pyright)
RUN apk --no-cache add \
    python3 \
    py-pip \
    nodejs \
    npm

RUN npm i -g pyright

# Add an example project
RUN git clone https://github.com/davidhalter/jedi.git && \
    cd jedi && \
    git submodule update --init && \
    pip install -e .

WORKDIR /jedi
