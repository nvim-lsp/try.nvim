ARG TAG=base-stable
FROM try.nvim:$TAG

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

# Install dependencies for rust-analyzer
RUN apk --no-cache add rust-src curl

# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install rust-analyzer
RUN curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > /usr/local/bin/rust-analyzer && \
    chmod +x /usr/local/bin/rust-analyzer

# Download example codebases for Rust
RUN git clone https://github.com/BurntSushi/ripgrep.git

WORKDIR /ripgrep
