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

# Add a language server (julia)
RUN apk --no-cache add julia

# Add an example project
RUN git clone --recursive git@github.com:FluxML/Flux.jl.git && \
    cd flux.jl && \
    pip install -e .

WORKDIR /flux.jl
