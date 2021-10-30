# try.nvim

try.nvim is repository that contains various example self-contained neovim containers. The goal of try.nvim is to improve bug reports related to system environment, neovim build issues, and user configuration, as well as to serve as a fast entrypoint to what the neovim experience should resemble when things are functioning.

### Quickstart

1. Ensure you have installed a container runtime such as podman (recommended) or Docker. See below for details.
2. To launch any of the containers run the following
  ```bash
  podman run --rm -it quay.io/nvim-lsp/try.nvim:nightly-lua
  ```
  
### Available containers
Please see the nvim-lsp organization on quay for a list of [available tags](https://quay.io/repository/nvim-lsp/try.nvim?tab=tags). Generally, the containers follow the schema ${release}-${language} where release is either nightly or stable (neovim builds) and language is the name of the language tooling provided in the container.

### Installing podman

On Fedora/RHEL systems, podman should should pre-installed. Otherwise:
```bash
sudo dnf install podman  
```

On Debian or derivatives (Ubuntu):
```bash
sudo apt install podman  
```

On Arch:
```bash
pacman -Syuu podman
```

On macOS:
```
brew install podman


# Required on macOS to initialize QEMU VM. Only required once.
podman machine init

# Must be done each restart.
podman machine start
```

For other linux distributions, please consult the package repositories. For Windows, use Docker.

### Containers

A container can be thought of as a "lightweight" virtual machine, except instead of virtualizing the hardware, a container virtualizes the operating system and its libraries. This is advantageous, as a container has very little runtime overhead compared to a virtual machine. It can share the operating system kernel, and thus requires less memory and resources compared to a VM.

In order to use a container, you need to have a container runtime installed (podman, Docker, containerd, CRI-O). We recommend [podman](https://podman.io/), which is a rootless, daemonless alternative to Docker which ships pre-installed on Fedora/RHEL linux distributions. 

Please read the following resources if you are interested in learning more:

* [Redhat's container terminology introduction](https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction#)
