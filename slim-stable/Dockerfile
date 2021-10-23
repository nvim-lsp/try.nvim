# Build neovim separately in the first stage
FROM alpine:latest AS base

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

RUN cd neovim && git checkout stable && make -j install && rm -rf /neovim

FROM alpine:latest

# In the second stage, copy over neovim (only) and add the defaults.nvim configuration
# To run neovim, sorry no static linking
RUN apk --no-cache add \
    libgcc

COPY --from=base /usr/local/lib/nvim /usr/local/lib/nvim
COPY --from=base /usr/local/share/nvim /usr/local/share/nvim
COPY --from=base /usr/local/bin/nvim /usr/local/bin/nvim

# To support defaults.nvim
RUN apk --no-cache add \
    fd  \
    ctags \
    ripgrep \
    git
