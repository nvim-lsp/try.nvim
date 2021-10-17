
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

# Install sumneko
RUN apk --no-cache add \
    git \
    build-base \
    ninja \
    bash 

RUN mkdir -p /root/.local/bin && \
    cd /root/.local/bin &&  \
    git clone https://github.com/sumneko/lua-language-server sumneko_lua && \
    cd sumneko_lua && \
    git submodule update --init --recursive && \
    cd 3rd/luamake && \
    ./compile/install.sh && \
    cd ../.. && \
    ./3rd/luamake/luamake rebuild

WORKDIR /lua-test

# Install sumneko
RUN apk --no-cache add \
    tmux

COPY ./launch_split.sh /launch_split.sh
COPY ./tmux.conf /root/.tmux.conf

ENTRYPOINT bash /launch_split.sh
