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
RUN INSTALL=1 nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# Install dependencies for rust-analyzer
RUN apk --no-cache add curl build-base

# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add rustup to path
ENV ENV="/root/.profile"
ENV PATH=$PATH:/root/.cargo/bin

# Install rust-analyzer
RUN rustup default nightly
RUN rustup +nightly component add rust-analyzer-preview rust-src

# Download example codebases for Rust
RUN git clone https://github.com/BurntSushi/ripgrep.git

WORKDIR /ripgrep

RUN cargo build
