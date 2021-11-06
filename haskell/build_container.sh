# podman build -t haskell-sync-debug .
podman push haskell-sync-debug quay.io/mjlbach/debug-containers:haskell
# podman run --rm -it haskell-sync-debug

podman run --rm -it quay.io/mjlbach/debug-containers:haskell
