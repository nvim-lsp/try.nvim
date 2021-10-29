ARG TAG=base-nightly
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

# Add a language server (pyright)
RUN apk --no-cache add \
    python3 \
    py-pip \
    nodejs \
    npm

RUN npm i -g pyright

# Add an example project
RUN git clone --recursive https://github.com/davidhalter/jedi.git && \
    cd jedi && \
    pip install -e .

WORKDIR /jedi
