ARG TAG=base-nightly

# Build neovim separately in the first stage
FROM haskell:8.8.3 as base

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    make \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \
    curl \
    doxygen && \
rm -rf /var/lib/apt/lists/*

RUN git config --global http.sslverify false

RUN git clone https://github.com/mjlbach/neovim.git --branch lsp-on-lines

RUN cd neovim && make install && rm -rf /neovim

FROM haskell:8.8.3

COPY --from=base /usr/local/lib/nvim /usr/local/lib/nvim
COPY --from=base /usr/local/share/nvim /usr/local/share/nvim
COPY --from=base /usr/local/bin/nvim /usr/local/bin/nvim

# RUN apk --no-cache add \
#     fd  \
#     ctags \
#     ripgrep \
#     git

# Copy the kickstart.nvim init.lua
COPY ./init.lua /root/.config/nvim/init.lua

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        git && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fLO https://github.com/haskell/haskell-language-server/releases/download/1.4.0/haskell-language-server-Linux-8.8.3.gz && \
 gunzip haskell-language-server-Linux-8.8.3.gz &&  \
 chmod +x haskell-language-server-Linux-8.8.3 && \
 mv haskell-language-server-Linux-8.8.3 /usr/local/bin/haskell-language-server-wrapper

# Install the kickstart.nvim dependencies, INSTALL env var is a hack
RUN INSTALL=1 /usr/local/bin/nvim --headless +'autocmd User PackerComplete qall' +PackerSync

RUN stack install brittany --resolver lts-16.0

COPY ./main.hs /my-haskell-project/main.hs

RUN cd /my-haskell-project && touch test.cabal

WORKDIR /my-haskell-project

ENTRYPOINT /bin/bash
